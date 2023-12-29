import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_buttonlist_direction.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

enum ButtonDirection {
  horizontal,
  vertical,
}

// ignore: must_be_immutable
class CustomDialog extends StatelessWidget {
  final String contentTitleText;
  final String? contentDetailText;
  final String? imageLink;
  final String buttonText;
  final String? cancelButtonText;
  final VoidCallback onSubmit;
  final VoidCallback? onCancelSubmit;
  ButtonDirection buttonDirection;
  bool isButtonWidthHalf;

  CustomDialog({
    super.key,
    required this.contentTitleText,
    this.contentDetailText,
    this.imageLink,
    required this.buttonText,
    this.cancelButtonText,
    required this.onSubmit,
    this.onCancelSubmit,
    this.buttonDirection = ButtonDirection.horizontal,
    this.isButtonWidthHalf = true,
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
                if (imageLink != null)
                  SizedBox(
                    width: 90,
                    height: 90,
                    child: Image.asset(
                      imageLink!,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (imageLink != null)
                  const SizedBox(
                    height: 10,
                  ),
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    contentTitleText,
                    style: FontSizes.getContentStyle().copyWith(
                        color: theme.appColors.iconButton,
                        fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
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
                      textAlign: TextAlign.center,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
      actions: [
        // 버튼 두개인지 아닌지
        if (cancelButtonText == null)
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            child: RoundedButton(
              text: buttonText,
              backgroundColor: lightTheme.primaryColor,
              foregroundColor: theme.appColors.iconButton,
              onPressed: onSubmit,
            ),
          ),
        if (cancelButtonText != null)
          getDirectionActionList(context, buttonDirection,
              isButtonWidthHalf: isButtonWidthHalf,
              buttonText: buttonText,
              cancelButtonText: cancelButtonText,
              onSubmit: onSubmit,
              onCancelSubmit: onCancelSubmit)
      ],
    );
  }
}
