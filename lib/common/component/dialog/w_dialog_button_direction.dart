import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class DialogAction {
  BuildContext context;
  String buttonText;
  String? cancelButtonText;
  VoidCallback handleSubmit;
  VoidCallback? handleCancelSubmit;

  DialogAction({
    required this.context,
    required this.buttonText,
    required this.cancelButtonText,
    required this.handleSubmit,
    required this.handleCancelSubmit,
  });

  getOneButton() {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      width: double.infinity,
      child: dialogButton(
          theme, lightTheme.primaryColor, buttonText, handleSubmit),
    );
  }

  getHorizontalPosition() {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: dialogButton(theme, theme.appColors.grayButtonBackground,
              cancelButtonText!, handleCancelSubmit!),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: dialogButton(
              theme, lightTheme.primaryColor, buttonText, handleSubmit),
        ),
      ],
    );
  }

  getHorizontalPositionDiffButton() {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: deviceWidth * 0.19,
          child: dialogButton(theme, theme.appColors.grayButtonBackground,
              cancelButtonText!, handleCancelSubmit!),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: dialogButton(
              theme, lightTheme.primaryColor, buttonText, handleSubmit),
        ),
      ],
    );
  }

  getVerticalPosition() {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Container(
      constraints: const BoxConstraints(maxWidth: 300),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: dialogButton(
                theme, lightTheme.primaryColor, buttonText, handleSubmit),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: Center(
              child: InkWell(
                onTap: handleCancelSubmit,
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
