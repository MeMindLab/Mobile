import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

void getCustomDialog(
  BuildContext context, {
  required String buttonText,
  String? imageLink,
  required String contentTitleText,
  String? contentDetailText,
  String? buttonSubText,
  required VoidCallback OnSubmit,
  VoidCallback? subOnSubmit,
  required bool isTwinButton,
  bool? isVertical,
  bool? isButtonHalf,
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
          subOnSubmit: subOnSubmit,
          isTwinButton: isTwinButton,
          isVertical: isVertical ?? false,
          isButtonHalf: isButtonHalf ?? false,
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
  final VoidCallback? subOnSubmit;
  bool isTwinButton;
  bool isVertical;
  bool isButtonHalf;

  CustomDialog({
    super.key,
    required this.contentTitleText,
    this.contentDetailText,
    this.imageLink,
    required this.buttonText,
    this.buttonSubText,
    required this.OnSubmit,
    this.subOnSubmit,
    required this.isTwinButton,
    this.isVertical = false,
    this.isButtonHalf = true,
  });

  Widget getActionList(BuildContext context, bool checkVertical) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    num buttonOneWidth = isButtonHalf! ? 135 : 70;
    num buttonTwoWidth = isButtonHalf! ? 135 : 200;
    // 수평인 경우
    if (checkVertical == false) {
      return Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: buttonOneWidth.toDouble(),
              decoration: BoxDecoration(
                  color: theme.appColors.grayButtonBackground,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  child: Text(buttonText,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(color: theme.appColors.iconButton)),
                  onPressed: OnSubmit),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: buttonTwoWidth.toDouble(),
              decoration: BoxDecoration(
                  color: lightTheme.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                child: Text(
                  buttonSubText!,
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.iconButton),
                ),
                onPressed: subOnSubmit,
              ),
            ),
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
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: lightTheme.primaryColor,
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: TextButton(
                  child: Text(buttonText,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(color: theme.appColors.iconButton)),
                  onPressed: OnSubmit),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: double.infinity,
              child: Center(
                child: InkWell(
                  onTap: subOnSubmit,
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
        if (isTwinButton == true) getActionList(context, isVertical)
      ],
    );
  }
}
