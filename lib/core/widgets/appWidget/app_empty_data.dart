import 'package:currency_watch/core/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../helpers/app_size.dart';
import '../../theme/app_colors.dart';
import 'app_text.dart';

class AppEmptyData extends StatelessWidget {
  final String title;
  final Color? color;

  const AppEmptyData({super.key, required this.title, this.color});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppText(
        text: title,
        textSize: 20.sp,
        textColor: color ?? AppColors.whiteColor,
        textAlign: TextAlign.center,
      ).addSymmetricPadding(vVal: AppSize.h20),
    );
  }
}
