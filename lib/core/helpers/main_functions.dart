import 'package:currency_watch/core/theme/app_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'extensions.dart';
// import 'package:image_picker/image_picker.dart';

/// Show Alert Dialog ///
/// Show Alert Dialog ///
customAlertDialog({
  required Widget content,
  bool? barrierDismissible,
  double? marginHPadding,
  double? marginVPadding,
  double? radius,
  int? duration,
  double? hPadding,
  double? vPadding,
  double? width,
  bool? type,
}) {
  type = type ?? true;
  showDialog(
      context: GlobalContextExt.globalContext!,
      barrierDismissible: barrierDismissible ?? true,
      builder: (context) {
        type == false
            ? null
            : Future.delayed(Duration(milliseconds: duration ?? 2000), () {
                if (context.mounted) {
                  context.pop();
                }
              });
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius ?? 20.r),
                  color: AppColors.mainAppLightColor),
              padding: EdgeInsets.symmetric(
                  horizontal: hPadding ?? 0.0, vertical: vPadding ?? 0.0),
              margin: EdgeInsets.symmetric(
                  horizontal: marginHPadding ?? 0.0,
                  vertical: marginVPadding ?? 0.0),
              child: Material(
                color: AppColors.mainAppLightColor,
                child: content,
              ),
            ),
          ],
        );
      });
}

/// show toast message //
showToast({required String text, int? time, required Color color}) {
  return Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: time ?? 6,
      backgroundColor: color,
      textColor: AppColors.whiteColor,
      fontSize: 16.0);
}


// time format method
String dateFormatMethod({
  required String dateTimeAsString,
  required String pattern,
   String? languageCode,

}) {
  return DateFormat(
    pattern,
   languageCode?? (EasyLocalization.of(GlobalContextExt.globalContext!)
            ?.currentLocale
            ?.languageCode ??
        "en"),
  ).format(
    DateTime.tryParse(dateTimeAsString) ?? DateTime.now(),
  );
}

// try parse from sting type to dateTime type
DateTime parseToDateTime(String stringDate) {
  return DateTime.tryParse(stringDate) ?? DateTime.now();
}

// method to check if language is En
bool isEnglish() =>
    (EasyLocalization.of(GlobalContextExt.globalContext!)?.currentLocale?.languageCode ?? "en") == "en";

bool hasHourPassed(DateTime pastTime) {
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(pastTime);

  return difference.inHours >= 1;
}


String convertToArabicNumerals(double number) {
  const westernToArabic = {
    '0': '٠', '1': '١', '2': '٢', '3': '٣', '4': '٤',
    '5': '٥', '6': '٦', '7': '٧', '8': '٨', '9': '٩'
  };

  return number.toString().split('').map((char) => westernToArabic[char] ?? char).join('');
}
