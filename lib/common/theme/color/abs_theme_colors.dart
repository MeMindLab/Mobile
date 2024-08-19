import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';

typedef ColorProvider = Color Function();

abstract class AbstractThemeColors {
  const AbstractThemeColors();

  Color get seedColor => Colors.white;

  Color get scrollableItem => const Color.fromARGB(255, 57, 57, 57);

  Color get iconButton => const Color.fromARGB(255, 0, 0, 0);

  Color get iconButtonInactivate => const Color.fromARGB(255, 162, 162, 162);

  Color get inActivate => const Color.fromARGB(255, 200, 207, 220);

  Color get activate => const Color.fromARGB(255, 63, 72, 95);

  Color get badgeBorder => Colors.transparent;

  Color get divider => const Color.fromARGB(255, 228, 228, 228);

  Color get text => AppColors.gray9;

  Color get hintText => AppColors.gray6;

  Color get focusedBorder => const Color(0xff26ff8c);

  Color get confirmText => AppColors.blue6;

  Color get blueButtonBackground => AppColors.blueMain;

  Color get grayButtonBackground => AppColors.gray3;

  Color get userInputBackground => AppColors.blue2;

  Color get checkColor => AppColors.midnightBlue;

  Color get userChatBackground => AppColors.blue5;

  Color get chatBubble => AppColors.blue5;

  Color get datetimeColor => AppColors.gray5;

  Color get reportBgColor => AppColors.blue4;

  Color get iconBook => AppColors.gray7;

  Color get loginInputBackground => AppColors.blue1;

  Color get capsule => AppColors.blue3;

  Color get trashColor => AppColors.trashColor;
}
