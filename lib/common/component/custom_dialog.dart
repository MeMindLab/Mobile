import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

enum ButtonDirection {
  horizontal,
  vertical,
}

void getCustomDialog(
  BuildContext context, {
  required String buttonText,
  String? imageLink,
  required String contentTitleText,
  String? contentDetailText,
  String? buttonSubText,
  required VoidCallback OnSubmit,
  VoidCallback? onSecondSubmit,
  required bool isTwinButton,
  ButtonDirection? buttonDirection,
  bool? isButtonWidthHalf,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          contentTitleText: contentTitleText,
          contentDetailText: contentDetailText,
          imageLink: imageLink,
          buttonText: buttonText,
          buttonSubText: buttonSubText,
          OnSubmit: OnSubmit,
          onSecondSubmit: onSecondSubmit,
          isTwinButton: isTwinButton,
          buttonDirection: buttonDirection ?? ButtonDirection.horizontal,
          isButtonWidthHalf: isButtonWidthHalf ?? false,
        );
      });
}

class CustomDialog extends StatelessWidget {
  final String contentTitleText;
  final String? contentDetailText;
  final String? imageLink;
  final String buttonText;
  final String? buttonSubText;
  final VoidCallback OnSubmit;
  final VoidCallback? onSecondSubmit;
  bool isTwinButton;
  ButtonDirection buttonDirection;
  bool isButtonWidthHalf;

  CustomDialog({
    super.key,
    required this.contentTitleText,
    this.contentDetailText,
    this.imageLink,
    required this.buttonText,
    this.buttonSubText,
    required this.OnSubmit,
    this.onSecondSubmit,
    required this.isTwinButton,
    this.buttonDirection = ButtonDirection.horizontal,
    this.isButtonWidthHalf = true,
  });

  Widget getActionButton(num buttonWidth, CustomTheme theme, Color bgColor,
      String contentText, VoidCallback onSubmit) {
    return Container(
      width: buttonWidth.toDouble(),
      decoration: BoxDecoration(
          color: bgColor,
          // color: theme.appColors.grayButtonBackground,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
          child: Text(contentText,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(color: theme.appColors.iconButton)),
          onPressed: onSubmit),
    );
  }

  Widget getActionList(BuildContext context, ButtonDirection checkDirection) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    num buttonOneWidth = isButtonWidthHalf ? 135 : 70;
    num buttonTwoWidth = isButtonWidthHalf ? 135 : 200;
    // 수평인 경우
    if (checkDirection == ButtonDirection.horizontal) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getActionButton(buttonOneWidth, theme,
                theme.appColors.grayButtonBackground, buttonText, OnSubmit),
            const SizedBox(
              width: 10,
            ),
            getActionButton(buttonTwoWidth, theme, lightTheme.primaryColor,
                buttonSubText!, onSecondSubmit!),
          ],
        ),
      );
    } else {
      // 수직인 경우
      return Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getActionButton(double.infinity, theme, lightTheme.primaryColor,
                buttonText, OnSubmit),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: InkWell(
                  onTap: onSecondSubmit,
                  child: Text(
                    buttonSubText!,
                    style: FontSizes.getCapsuleStyle()
                        .copyWith(color: theme.appColors.hintText),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return AlertDialog(
      backgroundColor: theme.appColors.seedColor,
      surfaceTintColor: theme.appColors.badgeBorder,
      contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
      actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: SizedBox(
        width: 470,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                if (imageLink != null)
                  Container(
                    width: 200,
                    height: 200,
                    child: Image.asset(
                      imageLink!,
                      fit: BoxFit.cover,
                    ),
                  ),
                if (imageLink != null)
                  const SizedBox(
                    height: 10,
                  ),
                Text(
                  contentTitleText,
                  style: FontSizes.getContentStyle()
                      .copyWith(color: theme.appColors.iconButton),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (contentDetailText != null)
                  Text(
                    contentDetailText!,
                    style: FontSizes.getCapsuleStyle()
                        .copyWith(color: theme.appColors.iconButton),
                    textAlign: TextAlign.center,
                  )
              ],
            )
          ],
        ),
      ),
      actions: [
        // 버튼 두개인지 아닌지
        if (isTwinButton == false)
          Container(
            margin: const EdgeInsets.only(bottom: 5),
            width: double.infinity,
            child: RoundedButton(
              text: buttonText,
              backgroundColor: lightTheme.primaryColor,
              foregroundColor: theme.appColors.iconButton,
              onPressed: OnSubmit,
            ),
          ),
        if (isTwinButton == true) getActionList(context, buttonDirection)
      ],
    );
  }
}
