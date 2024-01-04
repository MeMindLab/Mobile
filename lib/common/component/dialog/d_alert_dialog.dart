import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_content.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class AlertDialogs {
  static Future alertDialog({
    required BuildContext context,
    required String title,
    String? body,
    required List<Widget> actions,
    TextAlign textAlign = TextAlign.center,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        CustomTheme theme = CustomThemeHolder.of(context).theme;

        return AlertDialog(
          backgroundColor: theme.appColors.seedColor,
          surfaceTintColor: theme.appColors.badgeBorder,
          contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          content: dialogContent(
              title: title, body: body, theme: theme, textAlign: textAlign),
          actions: [
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                child: Column(
                  children: actions,
                ))
          ],
        );
      },
    );
  }
}
