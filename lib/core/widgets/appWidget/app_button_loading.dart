import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:flutter/material.dart';

import '../../helpers/app_size.dart';
import '../../theme/app_colors.dart';
import 'app_button.dart';
import 'app_loading_indicator.dart';
import 'app_text.dart';

class AppButtonLoading extends StatelessWidget {
  final String title;
  final double? height, width, radius;
  final bool? hasBackgroundImage;

  const AppButtonLoading(
      {super.key,
      required this.title,
      this.height,
      this.width,
      this.radius,
      this.hasBackgroundImage});

  @override
  Widget build(BuildContext context) {
    return AppButton(
      radius: radius,
      hasBackgroundImage: hasBackgroundImage ?? false,
      onTap: null,
      height: height ?? AppSize.h45,
      width: width ?? double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: title,
            textAlign: TextAlign.center,
            textWeight: FontWeight.w600,
            textColor: AppColors.whiteColor,
          ),
          AppSize.w10.pw,
          SizedBox(
              width: 30,
              child: AppLoadingIndicator(
                color: AppColors.whiteColor,
              )),
        ],
      ),
    );
  }
}
