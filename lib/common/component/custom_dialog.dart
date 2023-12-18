import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';

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
    return AlertDialog(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
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
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: AppColors.blue8),
                  ),
                if (widget.contentTitleText != null)
                  const SizedBox(
                    height: 10,
                  ),
                if (widget.contentdetailText != null)
                  Text(
                    widget.contentdetailText!,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue8),
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
              backgroundColor: AppColors.yellow,
              foregroundColor: AppColors.blue8,
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
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 238, 151, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    child: Text(widget.buttonText,
                        style: const TextStyle(color: Colors.black)),
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
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(229, 229, 229, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                    child: Text(
                      widget.buttonSubText!,
                      style: const TextStyle(color: Colors.black),
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
