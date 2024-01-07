import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class Capsule extends StatelessWidget {
  final String keyword;
  final Color? color;

  const Capsule({
    super.key,
    required this.keyword,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 3),
      decoration: BoxDecoration(
        color: color ?? theme.appColors.chatBubble,
        borderRadius: BorderRadius.circular(50.0),
      ),
      child: Text(
        "#$keyword",
        style: FontSizes.getCapsuleStyle(),
      ),
    );
  }
}
