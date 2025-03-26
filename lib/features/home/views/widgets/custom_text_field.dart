import 'package:currency_watch/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDateTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;

  final Function()? onTap;

  const CustomDateTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.onTap,
  });

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
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.blueColor,
        ),
        hintText: hintText,
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
