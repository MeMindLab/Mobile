import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button_direction.dart';
import 'package:me_mind/common/component/dialog/w_dialog_content.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class NormalDialog extends StatelessWidget {
  final String contentTitleText;
  final String? contentDetailText;
  final String buttonText;
  final String? cancelButtonText;
  final VoidCallback handleSubmit;
  final VoidCallback? handleCancelSubmit;

  NormalDialog({
    super.key,
    required this.contentTitleText,
    this.contentDetailText,
    required this.buttonText,
    this.cancelButtonText,
    required this.handleSubmit,
    this.handleCancelSubmit,
  });

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final deviceWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: theme.appColors.seedColor,
      surfaceTintColor: theme.appColors.badgeBorder,
      contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
      actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Container(
        width: deviceWidth * 0.75,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: dialogContent(
            textAlign: TextAlign.center,
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            theme: theme),
      ),
      actions: [
        DialogAction(
                context: context,
                buttonText: buttonText,
                cancelButtonText: cancelButtonText,
                handleSubmit: handleSubmit,
                handleCancelSubmit: handleCancelSubmit)
            .getOneButton()
      ],
    );
  }
}
