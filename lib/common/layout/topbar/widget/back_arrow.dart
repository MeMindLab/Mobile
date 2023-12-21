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

    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: theme.appColors.iconButton,
      ),
    );
  }
}
