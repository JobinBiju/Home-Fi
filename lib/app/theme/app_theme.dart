import 'package:flutter/material.dart';
import 'package:home_fi/app/theme/color_theme.dart';

enum AppTheme {
  MaroonLight,
  MaroonDark,
}

final appThemeData = {
  AppTheme.MaroonLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: GFTheme.primaryMaroon,
    accentColor: GFTheme.primaryMaroon,
    scaffoldBackgroundColor: GFTheme.white1,
    primaryColorLight: GFTheme.secondaryMaroon,
    primaryColorDark: GFTheme.secondaryGrey,
    colorScheme: ColorScheme.light(
      primary: GFTheme.primaryMaroon,
    ),
  ),
  AppTheme.MaroonDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: GFTheme.secondaryMaroon,
    scaffoldBackgroundColor: GFTheme.primaryGrey,
    primaryColorDark: GFTheme.white2,
    primaryColorLight: GFTheme.secondaryGrey,
    colorScheme: ColorScheme.dark(
      primary: GFTheme.secondaryMaroon,
    ),
  ),
};
