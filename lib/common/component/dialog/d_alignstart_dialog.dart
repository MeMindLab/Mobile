import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button_direction.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class AlignStartDialog extends StatelessWidget {
  final String contentTitleText;
  final String? contentDetailText;
  final String buttonText;
  final String? cancelButtonText;
  final VoidCallback handleSubmit;
  final VoidCallback? handleCancelSubmit;

  AlignStartDialog({
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    contentTitleText,
                    style: FontSizes.getContentStyle().copyWith(
                        color: theme.appColors.iconButton,
                        fontWeight: FontWeight.w600,
                        fontFamily: "Pretendard"),
                    textAlign: TextAlign.start,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (contentDetailText != null)
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      contentDetailText!,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(color: theme.appColors.iconButton),
                      textAlign: TextAlign.start,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
      actions: [
        // 버튼 두개인지 아닌지
        cancelButtonText == null
            ? Container(
                margin: const EdgeInsets.only(bottom: 5),
                width: double.infinity,
                child: dialogButton(
                    theme, lightTheme.primaryColor, buttonText, handleSubmit))
            : dialogButtonHorizontal(context,
                isButtonWidthHalf: true,
                buttonText: buttonText,
                cancelButtonText: cancelButtonText,
                onSubmit: handleSubmit,
                onCancelSubmit: handleCancelSubmit)
      ],
    );
  }
}
