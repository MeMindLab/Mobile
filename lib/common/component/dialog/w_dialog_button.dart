import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class AlertDialogButton extends StatelessWidget {
  final Color bgColor;
  final String content;
  final VoidCallback onSubmit;

  const AlertDialogButton(
      {super.key,
      required this.bgColor,
      required this.content,
      required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          child: Text(content,
              style: FontSizes.getContentStyle().copyWith(
                  color: AppColors.gray9, fontWeight: FontWeight.w500)),
          onPressed: onSubmit),
    );
  }
}

List<Widget> customDialogActions(
    {bool? isColumn = false,
    required String firstText,
    required VoidCallback firstSubmit,
    String? secondText,
    VoidCallback? secondSubmit,
    Color? firstColor,
    Color? secondColor}) {
  bool isSecond = secondText == null ? false : true;

  return isColumn == false
      ? isSecond == false
          ? [
              AlertDialogButton(
                bgColor: firstColor ?? AppColors.blueMain,
                content: firstText,
                onSubmit: firstSubmit,
              )
            ]
          : [
              Flex(
                direction: Axis.horizontal,
                children: [
                  Flexible(
                    flex: 2,
                    child: AlertDialogButton(
                      bgColor: firstColor ?? AppColors.gray4,
                      content: firstText,
                      onSubmit: firstSubmit,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    flex: 5,
                    child: AlertDialogButton(
                      bgColor: secondColor ?? AppColors.blueMain,
                      content: secondText!,
                      onSubmit: secondSubmit!,
                    ),
                  )
                ],
              )
            ]
      : [
          Column(
            children: [],
          )
        ];
}
