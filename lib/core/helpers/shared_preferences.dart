// ignore_for_file: type_literal_in_constant_pattern

import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  static init() async {
    prefs = await SharedPreferences.getInstance();
  }

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    log('SharedPrefHelper : data with key : $key has been removed');
    await prefs.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    log('SharedPrefHelper : all data has been cleared');
    await prefs.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    log("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await prefs.setString(key, value);
        break;
      case int:
        await prefs.setInt(key, value);
        break;
      case bool:
        await prefs.setBool(key, value);
        break;
      case double:
        await prefs.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  static Future<void> setLanguage(String value) {
    return prefs.setString('language', value);
  }

  static String getLanguage() {
    try {
      return prefs.getString('language') ?? "en";
    } catch (e) {
      return 'en';
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) {
    log('SharedPrefHelper : getBool with key : $key');
    return prefs.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) {
    log('SharedPrefHelper : getDouble with key : $key');
    return prefs.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) {
    log('SharedPrefHelper : getInt with key : $key');
    return prefs.getInt(key) ?? "-";
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) {
    log('SharedPrefHelper : getString with key : $key');
    return prefs.getString(key) ?? '';
  }
}
