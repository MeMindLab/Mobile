import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

Widget dialogButton(CustomTheme theme, Color bgColor, String contentText,
    VoidCallback onSubmit) {
  return Container(
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: TextButton(
        style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
        child: Text(contentText,
            style: FontSizes.getCapsuleStyle()
                .copyWith(color: theme.appColors.iconButton)),
        onPressed: onSubmit),
  );
}
