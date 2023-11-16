import "package:flutter/material.dart";
import "package:me_mind/common/theme/custom_theme.dart";

import "../theme/custom_theme_holder.dart";

class RoundedButton extends StatefulWidget {
  final Color? backgroundColor;
  final Color? foregroundColor;
  final String text;
  final double? height;
  final VoidCallback? onPressed;

  const RoundedButton({
    super.key,
    this.backgroundColor,
    this.foregroundColor,
    required this.text,
    this.height,
    this.onPressed,
  });

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor:
            widget.backgroundColor ?? theme.appColors.blueButtonBackground,
        foregroundColor: widget.foregroundColor ?? Colors.black,
        padding: const EdgeInsets.all(10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        minimumSize: Size(double.infinity, widget.height ?? 55),
      ),
      child: Text(widget.text),
    );
  }
}
