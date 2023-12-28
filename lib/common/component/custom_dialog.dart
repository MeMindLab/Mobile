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
  //첫번째 버튼 text
  required String buttonText,
  // 이미지 있을시 이미지 주소
  String? imageLink,
  required String contentTitleText,
  String? contentDetailText,
  // 두번째 버튼 text
  String? cancelButtonText,
  // 첫번째 버튼 콜백함수
  required VoidCallback OnSubmit,
  // 두번째 버튼 콜백함수
  VoidCallback? onCancelSubmit,
  // 버튼이 두개인지
  // 버튼 두개일시 배치 방향
  ButtonDirection? buttonDirection,
  // 버튼 두개일시 width
  bool? isButtonWidthHalf,
  TextAlign? textAlign,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          contentTitleText: contentTitleText,
          contentDetailText: contentDetailText,
          imageLink: imageLink,
          buttonText: buttonText,
          cancelButtonText: cancelButtonText,
          OnSubmit: OnSubmit,
          onCancelSubmit: onCancelSubmit,
          buttonDirection: buttonDirection ?? ButtonDirection.horizontal,
          isButtonWidthHalf: isButtonWidthHalf ?? false,
          textAlign: textAlign ?? TextAlign.center,
        );
      });
}

class CustomDialog extends StatelessWidget {
  final String contentTitleText;
  final String? contentDetailText;
  final String? imageLink;
  final String buttonText;
  final String? cancelButtonText;
  final VoidCallback OnSubmit;
  final VoidCallback? onCancelSubmit;
  ButtonDirection buttonDirection;
  bool isButtonWidthHalf;
  TextAlign? textAlign;

  CustomDialog({
    super.key,
    required this.contentTitleText,
    this.contentDetailText,
    this.imageLink,
    required this.buttonText,
    this.cancelButtonText,
    required this.OnSubmit,
    this.onCancelSubmit,
    this.buttonDirection = ButtonDirection.horizontal,
    this.isButtonWidthHalf = true,
    this.textAlign = TextAlign.center,
  });

  Widget getActionButton(num buttonWidth, CustomTheme theme, Color bgColor,
      String contentText, VoidCallback onSubmit) {
    return Container(
      constraints: BoxConstraints(
          minWidth: buttonWidth.toDouble() - 5,
          maxWidth: buttonWidth.toDouble() + 10),
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
    final deviceWidth = MediaQuery.of(context).size.width;
    num buttonOneWidth =
        isButtonWidthHalf ? deviceWidth * 0.35 : deviceWidth * 0.21;
    num buttonTwoWidth =
        isButtonWidthHalf ? deviceWidth * 0.35 : deviceWidth * 0.5;
    // 수평인 경우
    if (checkDirection == ButtonDirection.horizontal) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            getActionButton(
                buttonOneWidth,
                theme,
                theme.appColors.grayButtonBackground,
                cancelButtonText!,
                onCancelSubmit!),
            const SizedBox(width: 10),
            getActionButton(buttonTwoWidth, theme, lightTheme.primaryColor,
                buttonText, OnSubmit),
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
                  onTap: onCancelSubmit,
                  child: Text(
                    cancelButtonText!,
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
    final deviceWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      backgroundColor: theme.appColors.seedColor,
      surfaceTintColor: theme.appColors.badgeBorder,
      contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
      actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      content: Container(
        width: deviceWidth * 0.82,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Column(
              children: [
                if (imageLink != null)
                  SizedBox(
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
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    contentTitleText,
                    style: FontSizes.getContentStyle().copyWith(
                        color: theme.appColors.iconButton,
                        fontWeight: FontWeight.w600),
                    textAlign: textAlign,
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
                      textAlign: textAlign,
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
              onPressed: OnSubmit,
            ),
          ),
        if (cancelButtonText != null) getActionList(context, buttonDirection)
      ],
    );
  }
}
