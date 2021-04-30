import 'package:flutter/material.dart';
import 'package:home_automation/app/theme/color_theme.dart';

enum AppTheme {
  MaroonLight,
  MaroonDark,
}

final appThemeData = {
  AppTheme.MaroonLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: primaryMaroon,
    accentColor: primaryMaroon,
    scaffoldBackgroundColor: white1,
    primaryColorLight: white2,
    primaryColorDark: secondaryGrey,
    colorScheme: ColorScheme.light(
      primary: primaryMaroon,
    ),
  ),
  AppTheme.MaroonDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: secondaryMaroon,
    scaffoldBackgroundColor: primaryGrey,
    primaryColorDark: white2,
    primaryColorLight: secondaryGrey,
    colorScheme: ColorScheme.dark(
      primary: secondaryMaroon,
    ),
  ),
};
