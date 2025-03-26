import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_style.dart';

class AppText extends StatelessWidget {
  final String text;
  final FontWeight? textWeight;
  final TextAlign? textAlign;
  final double? textSize;
  final Color? textColor;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final TextDecoration? decoration;
  final TextDirection? textDirection;

  const AppText({
    super.key,
    required this.text,
    this.textAlign,
    this.textSize,
    this.textWeight,
    this.textColor,
    this.maxLines,
    this.textOverflow,
    this.decoration,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: textDirection,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: textOverflow,
      style: AppTextStyle.style(
        decoration: decoration ?? TextDecoration.none,
        textWeight: textWeight ?? FontWeight.w400,
        textSize: textSize ?? 14.sp,
        textColor: textColor ?? AppColors.textColor,
      ),
    );
  }
}
