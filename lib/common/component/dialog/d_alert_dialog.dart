import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_content.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class AlertDialogs {
  final BuildContext context;
  final String title;
  final String? body;
  final List<Widget> actions;
  final TextAlign textAlign;

  AlertDialogs(
      {required this.context,
      required this.title,
      this.body,
      required this.actions,
      this.textAlign = TextAlign.center});

  show() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        CustomTheme theme = CustomThemeHolder.of(context).theme;

        Widget newButton = Flexible(
          fit: FlexFit.tight,
          child: actions[0],
        );

        return AlertDialog(
          backgroundColor: theme.appColors.seedColor,
          surfaceTintColor: theme.appColors.badgeBorder,
          contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.79,
            child: DialogContent(
                title: title, body: body, theme: theme, textAlign: textAlign),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                child: Row(
                  children: [
                    newButton,
                  ],
                )),
          ],
        );
      },
    );
  }
}
