import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class SettingMenu extends StatelessWidget {
  final num height;
  final Widget content;
  final bool subscribe;

  const SettingMenu({
    super.key,
    required this.height,
    required this.content,
    required this.subscribe,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return Container(
      width: double.infinity,
      height: height.toDouble(),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(13)),
          color: subscribe == false ? Colors.white : null,
          gradient: subscribe == true
              ? LinearGradient(
                  colors: [
                    theme.appColors.blueButtonBackground,
                    theme.appColors.confirmText,
                  ],
                  begin: const Alignment(-0.3, -0.8),
                  end: const Alignment(1, 0.9),
                )
              : null),
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: content,
      ),
    );
  }
}
