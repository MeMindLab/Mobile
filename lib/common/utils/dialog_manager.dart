import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/custom_dialog.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

enum DialogType {
  lemon,
  twoButton,
  oneButton,
  custom,
}

class DialogManager {
  final DialogType type;
  final BuildContext context;

  DialogManager({
    required this.type,
    required this.context,
  });

  void show({
    String? titleText,
    String? contentText,
    String? firstButtonText,
    VoidCallback? firstSubmit,
    String? secondButtonText,
    VoidCallback? secondSubmit,
    Widget? customWidget,
    Color? oneContentTextColor,
  }) {
    switch (type) {
      case DialogType.oneButton:
        return showCustomDialog(
            context,
            CustomDialog(
              backgroundColor: Colors.white,
              dialogRadius: 13,
              actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
              title: titleText != null
                  ? Center(
                      child: Text(
                        titleText,
                        textAlign: TextAlign.center,
                        style: FontSizes.getHeadline2Style().copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray9),
                      ),
                    )
                  : null,
              content: contentText != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contentText,
                          textAlign: TextAlign.center,
                          style: FontSizes.getContentStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              color: oneContentTextColor ?? AppColors.gray9),
                        ),
                      ],
                    )
                  : null,
              actions: customDialogActions(
                firstText: firstButtonText!,
                firstSubmit: firstSubmit!,
              ),
            ));
      case DialogType.twoButton:
        return showCustomDialog(
            context,
            CustomDialog(
              backgroundColor: Colors.white,
              dialogRadius: 13,
              actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
              title: titleText != null
                  ? Center(
                      child: Text(
                        titleText,
                        textAlign: TextAlign.center,
                        style: FontSizes.getHeadline2Style().copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColors.gray9),
                      ),
                    )
                  : null,
              content: contentText != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contentText,
                          textAlign: TextAlign.center,
                          style: FontSizes.getContentStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray9),
                        ),
                      ],
                    )
                  : null,
              actions: customDialogActions(
                firstText: firstButtonText!,
                firstSubmit: firstSubmit!,
                secondText: secondButtonText,
                secondSubmit: secondSubmit,
              ),
            ));
      case DialogType.lemon:
        return showCustomDialog(
            context,
            CustomDialog(
              backgroundColor: Colors.white,
              dialogRadius: 13,
              actionsPadding:
                  const EdgeInsets.symmetric(horizontal: 15, vertical: 20.0),
              title: titleText != null
                  ? Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Image.asset("assets/image/icon/lemon_left.png"),
                              Image.asset("assets/image/icon/lemon.png"),
                              Image.asset("assets/image/icon/lemon_right.png"),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Text(
                            titleText,
                            textAlign: TextAlign.center,
                            style: FontSizes.getHeadline2Style().copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppColors.gray9),
                          ),
                        ],
                      ),
                    )
                  : null,
              content: contentText != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          contentText,
                          textAlign: TextAlign.center,
                          style: FontSizes.getContentStyle().copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray9),
                        ),
                      ],
                    )
                  : null,
              actions: customDialogActions(
                firstText: firstButtonText!,
                firstSubmit: firstSubmit!,
                secondText: secondButtonText,
                secondColor: lightTheme.primaryColor,
                secondSubmit: secondSubmit,
              ),
            ));
      case DialogType.custom:
        return showCustomDialog(context, CustomDialog(content: customWidget));
    }
  }
}
