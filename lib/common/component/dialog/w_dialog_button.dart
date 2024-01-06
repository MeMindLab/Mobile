import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class AlertDialogButton extends StatelessWidget {
  final CustomTheme theme;
  final Color bgColor;
  final String content;
  final VoidCallback onSubmit;

  const AlertDialogButton(
      {super.key,
      required this.theme,
      required this.bgColor,
      required this.content,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
          child: Text(content,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(color: theme.appColors.iconButton)),
          onPressed: onSubmit),
    );
  }
}
