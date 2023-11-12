import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/theme/color/abs_theme_colors.dart';

class DarkAppColors extends AbstractThemeColors {
  const DarkAppColors();

  @override
  Color get seedColor => AppColors.blackPearl;

  @override
  Color get activate => Colors.white;

  @override
  Color get badgeBg => AppColors.darkOrange;

  @override
  Color get divider => const Color.fromARGB(255, 93, 93, 93);

  @override
  Color get hintText => AppColors.grey;

  @override
  Color get iconButton => const Color.fromARGB(255, 255, 255, 255);

  @override
  Color get iconButtonInactivate => const Color.fromARGB(255, 131, 131, 131);

  @override
  Color get inActivate => const Color.fromARGB(255, 65, 68, 74);

  @override
  Color get text => Colors.white;

  @override
  Color get focusedBorder => AppColors.paleCornFlowerBlue;

  @override
  Color get blueButtonBackground => AppColors.blue;

  @override
  Color get mainBackground => AppColors.blackPearl;
}
