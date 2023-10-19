import 'package:flutter/material.dart';
import 'package:home_fi/app/theme/color_theme.dart';

enum AppTheme {
  maroonLight,
  maroonDark,
}

final appThemeData = {
  AppTheme.maroonLight: ThemeData(
    brightness: Brightness.light,
    primaryColor: GFTheme.primaryMaroon,
    // accentColor: GFTheme.primaryMaroon.withOpacity(0.3),
    scaffoldBackgroundColor: GFTheme.white1,
    primaryColorLight: GFTheme.secondaryMaroon,
    primaryColorDark: GFTheme.secondaryGrey,
    colorScheme: const ColorScheme.light(
      primary: GFTheme.primaryMaroon,
    ),
  ),
  AppTheme.maroonDark: ThemeData(
    brightness: Brightness.dark,
    primaryColor: GFTheme.secondaryMaroon,
    // accentColor: GFTheme.secondaryMaroon.withOpacity(0.3),
    scaffoldBackgroundColor: GFTheme.primaryGrey,
    primaryColorDark: GFTheme.white2,
    primaryColorLight: GFTheme.secondaryGrey,
    colorScheme: const ColorScheme.dark(
      primary: GFTheme.secondaryMaroon,
    ),
  ),
};
