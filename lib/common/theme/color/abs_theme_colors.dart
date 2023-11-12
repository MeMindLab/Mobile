import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get seedColor => const Color(0xff26ff8c);

  Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);

  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBg => AppColors.blueGreen;

  Color get textBadgeText => Colors.white;

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 228, 228, 228);

  Color get text => AppColors.darkGrey;

  Color get hintText => AppColors.middleGrey;

  Color get focusedBorder => const Color(0xff26ff8c);

  Color get confirmText => AppColors.blue;

  Color get drawerText => text;

  Color get blueButtonBackground => AppColors.paleCornFlowerBlue;

  Color get grayButtonBackground => AppColors.middleGrey;

  Color get mainBackground => AppColors.blackPearl;

  Color get userInputBackground => AppColors.brightGrey;
}
