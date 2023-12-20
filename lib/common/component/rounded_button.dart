import "dart:math";

import "package:flutter/material.dart";
import "package:me_mind/common/theme/custom_theme.dart";

import "../theme/custom_theme_holder.dart";

class RoundedButton extends StatelessWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final double? height;
  final VoidCallback? onPressed;
  final TextStyle? textStyle;
  final double? elevation;

  const RoundedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.height,
    this.onPressed,
    this.textStyle,
    this.elevation = 0,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: elevation,
        backgroundColor:
            backgroundColor ?? theme.appColors.blueButtonBackground,
        foregroundColor: foregroundColor ?? Colors.black,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        minimumSize: Size(double.infinity, height ?? 55),
      ),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
