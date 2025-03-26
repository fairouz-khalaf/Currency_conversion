import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:currency_watch/core/theme/app_colors.dart' show AppColors;
import 'package:currency_watch/core/widgets/appWidget/app_shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppImageView extends StatelessWidget {
  ///[imagePath] is required parameter for showing image
  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final bool isAvatar;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;

  ///a [AppImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  const AppImageView(
    this.imagePath, {
    super.key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.isAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment!,
            child: _buildWidget(),
          )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
        borderRadius: radius ?? BorderRadius.zero,
        child: _buildImageWithBorder(),
      );
    } else {
      return _buildImageWithBorder();
    }
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svgNetwork:
          return SvgPicture.network(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
          );
        case ImageType.svg:
          return SvgPicture.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            colorFilter: color == null
                ? null
                : ColorFilter.mode(color!, BlendMode.srcIn),
          );
        case ImageType.file:
          return Image.file(
            File(imagePath!),
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit ?? BoxFit.fill,
            imageUrl: imagePath!,
            color: color,
            imageBuilder: (context, imageProvider) => Hero(
              tag: imageProvider,
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  border: Border.all(color: color ?? AppColors.mainAppColor),
                  borderRadius: radius,
                  shape:
                      isAvatar == true ? BoxShape.circle : BoxShape.rectangle,
                  image: DecorationImage(
                    image: imageProvider,
                    fit: fit ?? BoxFit.fill,
                  ),
                ),
              ),
            ),
            placeholder: (context, url) => AppShimmer(avatar: isAvatar),
            errorWidget: (context, url, error) => isAvatar
                ? AppShimmer(avatar: isAvatar)
                : AppShimmer(height: height, width: width),
          );

        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
          );
      }
    }
    return const SizedBox();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if ((startsWith('http') || startsWith('https')) && endsWith('.svg')) {
      return ImageType.svgNetwork;
    } else if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (startsWith('file://') || startsWith('/data/user')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, unknown, svgNetwork }
