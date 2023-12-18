import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

void getCustomDialog(
  BuildContext context, {
  required String buttonText,
  String? contentTitleText,
  String? contentdetailText,
  String? buttonSubText,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          contentTitleText: contentTitleText,
          contentdetailText: contentdetailText,
          buttonText: buttonText,
          buttonSubText: buttonSubText,
        );
      });
}

class CustomDialog extends StatefulWidget {
  final String? contentTitleText;
  final String? contentdetailText;
  final String buttonText;
  final String? buttonSubText;
  const CustomDialog({
    Key? key,
    this.contentTitleText,
    this.contentdetailText,
    required this.buttonText,
    this.buttonSubText,
  }) : super(key: key);

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
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
                if (widget.contentTitleText != null)
                  Text(
                    widget.contentTitleText!,
                    style: FontSizes.getContentStyle()
                        .copyWith(color: theme.appColors.iconButton),
                  ),
                if (widget.contentTitleText != null)
                  const SizedBox(
                    height: 10,
                  ),
                if (widget.contentdetailText != null)
                  Text(
                    widget.contentdetailText!,
                    style: FontSizes.getCapsuleStyle()
                        .copyWith(color: theme.appColors.iconButton),
                  )
              ],
            )
          ],
        ),
      ),
      actions: [
        if (widget.buttonSubText == null)
          Center(
            child: RoundedButton(
              text: widget.buttonText,
              backgroundColor: lightTheme.primaryColor,
              foregroundColor: theme.appColors.iconButton,
              onPressed: () {},
            ),
          ),
        if (widget.buttonSubText != null)
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // 첫번째 버튼 너비
                  width: 180,
                  height: 41,
                  decoration: BoxDecoration(
                      color: lightTheme.primaryColor,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    child: Text(widget.buttonText,
                        style: FontSizes.getCapsuleStyle()
                            .copyWith(color: theme.appColors.iconButton)),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  // 2번째 버튼 너비
                  width: 90,
                  height: 41,
                  decoration: BoxDecoration(
                      color: theme.appColors.grayButtonBackground,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    child: Text(
                      widget.buttonSubText!,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
      ],
    );
  }
}
