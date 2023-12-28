import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class Capsule extends StatelessWidget {
  final String keyword;

  const Capsule({super.key, required this.keyword});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
        decoration: BoxDecoration(
          color: theme.appColors.chatBubble,
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: Text(
          "#$keyword",
          style: FontSizes.getCapsuleStyle(),
        ),
      ),
    );
  }
}
