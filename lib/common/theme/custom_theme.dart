import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/theme/color/abs_theme_colors.dart';
import 'package:me_mind/common/theme/shadows/abs_theme_shadows.dart';
import 'package:me_mind/common/theme/shadows/dark_app_shadows.dart';
import 'package:me_mind/common/theme/shadows/light_app_shadows.dart';

import 'color/dark_app_colors.dart';
import 'color/light_app_colors.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
  );

  const CustomTheme(this.appColors, this.appShadows);

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        return darkTheme;
      case CustomTheme.light:
        return lightTheme;
    }
  }
}

ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    colorScheme:
        ColorScheme.fromSeed(seedColor: CustomTheme.light.appColors.seedColor));

const darkColorSeed = Color(0xbcd5ff7e);
ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.veryDarkGrey,
    colorScheme: ColorScheme.fromSeed(
        seedColor: CustomTheme.dark.appColors.seedColor,
        brightness: Brightness.dark));
