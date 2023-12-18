import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';

class FontSizes {
  // 다른 폰트 사이즈 추가
  static const double xSmall = 12.0;
  static const double small = 14.0;
  static const double medium = 16.0;
  static const double large = 18.0;
  static const double xLarge = 20.0;

  static TextStyle getTextStyle({
    double size = medium,
    FontWeight fontWeight = FontWeight.normal,
    Color color = AppColors.gray9,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: fontWeight,
      color: color,
    );
  }

  static TextStyle getHeadline1Style() {
    return getTextStyle(size: xLarge);
  }

  static TextStyle getHeadline2Style() {
    return getTextStyle(size: large);
  }

  static TextStyle getContentStyle() {
    return getTextStyle();
  }

  static TextStyle getHighLightContentStyle() {
    return getTextStyle(size: large).copyWith(fontWeight: FontWeight.w500);
  }

  static TextStyle getCapsuleStyle() {
    return getTextStyle(size: small);
  }

  static TextStyle getCapsuleHighlightStyle() {
    return getTextStyle(size: small).copyWith(fontWeight: FontWeight.w500);
  }
}
