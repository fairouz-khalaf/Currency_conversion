import 'package:currency_watch/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text.dart';

class AppButton extends StatelessWidget {
  final Widget? child;
  final Color? background, borderColor, textColor, shadowColor;
  final Function()? onTap;
  final double? elevation, fontSize, height, width, radius;
  final String? title;
  final FontWeight? fontWeight;
  final bool? hasBackgroundImage;

  // final ImageProvider<Object> image;
  const AppButton({
    super.key,
    this.onTap,
    this.child,
    this.fontWeight,
    this.textColor,
    this.width,
    this.height,
    this.background,
    this.borderColor,
    this.radius,
    this.elevation,
    this.fontSize,
    this.title,
    this.hasBackgroundImage = false,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shadowColor: shadowColor ?? AppColors.mainAppColor,
        elevation: elevation ?? 0.0,
        minimumSize: Size(width ?? double.infinity, height ?? double.infinity),
        backgroundColor: background ?? AppColors.mainAppColor,
        backgroundBuilder: (context, states, child) {
          return Container(
            child: child!,
          );
        },
        side: BorderSide(color: borderColor ?? Colors.transparent),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(radius ?? 10.r)),
        ),
      ),
      onPressed: () {
        FocusManager.instance.primaryFocus?.unfocus();
        onTap?.call();
      },
      child: child ??
          AppText(
            text: title ?? '',
            textAlign: TextAlign.center,
            textSize: fontSize ?? 16.sp,
            textColor: textColor ?? Colors.white,
            textWeight: fontWeight ?? FontWeight.w600,
          ),
    );
  }
}
