import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class LinkText extends StatelessWidget {
  final String text;
  final String url;
  final Color? textColor;
  final Color? linkColor;
  final VoidCallback? onTap;

  const LinkText({
    super.key,
    required this.text,
    required this.url,
    this.textColor,
    this.linkColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color textBasicColor =
        CustomThemeHolder.of(context).theme.appColors.hintText;

    return GestureDetector(
      onTap: onTap,
      child: Text(
        text,
        style: TextStyle(
          decoration: TextDecoration.underline,
          decorationColor: linkColor ?? Colors.blue,
          color: textColor ?? textBasicColor,
        ),
      ),
    );
  }
}
