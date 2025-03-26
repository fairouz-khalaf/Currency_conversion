import 'package:currency_watch/core/helpers/app_strings.dart';
import 'package:easy_localization/easy_localization.dart';

String? validator(
    String? value, String? validationString, validationCondition) {
  if (validationCondition) {
    return validationString;
  }
  return null;
}

class AppValidation {
  static String? appValidation(val) =>
      validator(val, AppStrings.appValidate.tr(), val.toString().isEmpty);

  static String? passwordValidate(val) {
    if (val.toString().isEmpty) {
      return AppStrings.appValidate.tr();
    } else if (val!.length < 6) {
      return '';
    }
    return null;
  }
}
