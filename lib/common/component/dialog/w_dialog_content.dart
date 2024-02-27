import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class DialogContent extends StatelessWidget {
  final String? imageAddr;
  final String title;
  final String? body;
  final CustomTheme theme;
  final TextAlign? textAlign;

  const DialogContent(
      {super.key,
      this.imageAddr,
      required this.title,
      this.body,
      required this.theme,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          children: [
            if (imageAddr != null)
              SizedBox(
                width: 90,
                height: 90,
                child: Image.asset(
                  imageAddr!,
                  fit: BoxFit.cover,
                ),
              ),
            if (imageAddr != null)
              const SizedBox(
                height: 17,
              ),
            SizedBox(
              width: double.infinity,
              child: Text(
                title,
                style: FontSizes.getHeadline2Style().copyWith(
                    color: theme.appColors.iconButton,
                    fontWeight: FontWeight.w600,
                    fontFamily: "Pretendard"),
                textAlign: textAlign,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            if (body != null)
              SizedBox(
                width: double.infinity,
                child: Text(
                  body!,
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.iconButton),
                  textAlign: textAlign,
                ),
              )
          ],
        )
      ],
    );
  }
}
