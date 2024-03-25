import 'package:flutter/material.dart';

import 'package:me_mind/common/component/dialog/w_dialog_content.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class MultiChoiceDialog {
  final BuildContext context;
  final String? imageAddr;
  final String title;
  final String? body;
  final List<Widget> actions;
  final bool isRow;
  final TextAlign textAlign;
  final bool isNarrow;
  final double? titleTopPadding;

  MultiChoiceDialog({
    required this.context,
    this.imageAddr,
    required this.title,
    this.body,
    required this.actions,
    this.isRow = true,
    this.textAlign = TextAlign.center,
    this.isNarrow = false,
    this.titleTopPadding,
  });

  show() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        CustomTheme theme = CustomThemeHolder.of(context).theme;

        Widget leftButton = isRow == true
            ? Flexible(
                fit: FlexFit.tight,
                child: actions[0],
                flex: isNarrow == true ? 2 : 1,
              )
            : SizedBox(
                width: double.infinity,
                child: actions[0],
              );
        Widget rightButton = isRow == true
            ? Flexible(
                fit: FlexFit.tight,
                child: actions[1],
                flex: isNarrow == true ? 5 : 1,
              )
            : SizedBox(
                width: double.infinity,
                child: actions[1],
              );
        List<Widget> newActions = [
          leftButton,
          isRow == true ? SizedBox(width: 9) : SizedBox(height: 5),
          rightButton
        ];

        return AlertDialog(
          backgroundColor: theme.appColors.seedColor,
          surfaceTintColor: theme.appColors.badgeBorder,
          contentPadding: EdgeInsets.fromLTRB(
              0, titleTopPadding != null ? titleTopPadding! : 20, 0, 15),
          actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          content: SizedBox(
            width: MediaQuery.of(context).size.width * 0.79,
            child: DialogContent(
                imageAddr: imageAddr,
                title: title,
                body: body,
                theme: theme,
                textAlign: textAlign),
          ),
          actions: [
            Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                child: isRow == false
                    ? Column(
                        children: newActions,
                      )
                    : Row(
                        children: newActions,
                      )),
          ],
        );
      },
    );
  }
}
