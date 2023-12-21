import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class BackArrowLeading extends StatelessWidget {
  final VoidCallback? onPressed;

  const BackArrowLeading({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Padding(
      padding: const EdgeInsets.all(0),
      child: IconButton(
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        onPressed: onPressed ?? () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back,
          color: theme.appColors.iconButton,
        ),
      ),
    );
  }
}
