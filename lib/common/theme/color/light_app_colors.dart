import 'dart:ui';

import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/theme/color/abs_theme_colors.dart';

class LightAppColors extends AbstractThemeColors {
  const LightAppColors();

  @override
  Color get focusedBorder => AppColors.gray6;

  @override
  Color get divider => const Color(0xFFF1F3F9);
}
