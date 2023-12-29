import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

Widget dialogButtonHorizontal(BuildContext context,
    {isButtonWidthHalf,
    buttonText,
    cancelButtonText,
    onSubmit,
    onCancelSubmit}) {
  CustomTheme theme = CustomThemeHolder.of(context).theme;
  final deviceWidth = MediaQuery.of(context).size.width;

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      isButtonWidthHalf == true
          ? Expanded(
              child: dialogButton(theme, theme.appColors.grayButtonBackground,
                  cancelButtonText!, onCancelSubmit!),
            )
          : SizedBox(
              width: deviceWidth * 0.19,
              child: dialogButton(theme, theme.appColors.grayButtonBackground,
                  cancelButtonText!, onCancelSubmit!),
            ),
      const SizedBox(width: 10),
      Expanded(
        child:
            dialogButton(theme, lightTheme.primaryColor, buttonText, onSubmit),
      ),
    ],
  );
}

Widget dialogButtonVertical(BuildContext context,
    {buttonText, cancelButtonText, onSubmit, onCancelSubmit}) {
  CustomTheme theme = CustomThemeHolder.of(context).theme;

  return Container(
    constraints: const BoxConstraints(maxWidth: 300),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          child: dialogButton(
              theme, lightTheme.primaryColor, buttonText, onSubmit),
        ),
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
