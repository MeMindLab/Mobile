import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_content.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class MultiChoiceDialogs {
  static Future multiChoiceDialog({
    required BuildContext context,
    String? imageAddr,
    required String title,
    String? body,
    required List<Widget> actions,
    bool isRow = true,
    TextAlign textAlign = TextAlign.center,
  }) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        CustomTheme theme = CustomThemeHolder.of(context).theme;
        print(actions);

        List<Widget> newActions = [
          actions[0],
          isRow == true ? SizedBox(width: 5) : SizedBox(height: 15),
          actions[1]
        ];
        return AlertDialog(
          backgroundColor: theme.appColors.seedColor,
          surfaceTintColor: theme.appColors.badgeBorder,
          contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
          content: dialogContent(
              imageAddr: imageAddr,
              title: title,
              body: body,
              theme: theme,
              textAlign: textAlign),
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
