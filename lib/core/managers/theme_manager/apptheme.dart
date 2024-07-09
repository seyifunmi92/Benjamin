import 'package:flutter/material.dart';
import 'package:benjamin/core/managers/color_manager/colorhelper.dart';
// ignore_for_file: prefer_const_constructors

class AppTheme {
  AppTheme._();
  static AppTheme instance = AppTheme._();

  ThemeData get lightMode => ThemeData(
      primaryColor: ColorHelper.black,
      primaryColorLight: ColorHelper.black2,
      scaffoldBackgroundColor: ColorHelper.white,
      colorScheme: const ColorScheme.light(
        primary: ColorHelper.white,
        secondary: ColorHelper.black2,
      ),
      appBarTheme: AppBarTheme(color: ColorHelper.appBarLight));

  ThemeData get darkMode => ThemeData(
      primaryColor: ColorHelper.white,
      scaffoldBackgroundColor: ColorHelper.black,
      colorScheme: const ColorScheme.dark(
        primary: ColorHelper.black,
        secondary: ColorHelper.white2,
      ),
      appBarTheme: AppBarTheme(color: ColorHelper.appBarDark));
}
