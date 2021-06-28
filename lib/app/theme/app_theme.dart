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
    accentColor: GFTheme.primaryMaroon.withOpacity(0.3),
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
    accentColor: GFTheme.secondaryMaroon.withOpacity(0.3),
    scaffoldBackgroundColor: GFTheme.primaryGrey,
    primaryColorDark: GFTheme.white2,
    primaryColorLight: GFTheme.secondaryGrey,
    colorScheme: ColorScheme.dark(
      primary: GFTheme.secondaryMaroon,
    ),
  ),
};
