import 'package:currency_watch/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String englishLabel;
  final String arabicLabel;
  final String englishHint;
  final String arabicHint;
  final Function()? onTap;
  final bool isEnglish;

  const CustomDateTextField({
    super.key,
    required this.controller,
    required this.englishLabel,
    required this.arabicLabel,
    required this.englishHint,
    required this.arabicHint,
    required this.isEnglish,
    this.onTap,
  })  : labelText = '',
        hintText = '';

  const CustomDateTextField.withText({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.isEnglish,
    this.onTap,
  })  : englishLabel = '',
        arabicLabel = '',
        englishHint = '',
        arabicHint = '';

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: true,
      onTap: onTap,
      decoration: InputDecoration(
        suffixIcon: Icon(
          Icons.calendar_month_outlined,
          color: AppColors.blueColor,
        ),
        labelText: labelText.isNotEmpty
            ? labelText
            : isEnglish
                ? englishLabel
                : arabicLabel,
        labelStyle: TextStyle(
          color: AppColors.blueColor,
        ),
        hintText: hintText.isNotEmpty
            ? hintText
            : isEnglish
                ? englishHint
                : arabicHint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
