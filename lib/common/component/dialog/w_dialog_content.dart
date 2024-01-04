import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

Widget dialogContent(
    {String? imageAddr,
    required String title,
    String? body,
    theme,
    TextAlign? textAlign}) {
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
                imageAddr,
                fit: BoxFit.cover,
              ),
            ),
          if (imageAddr != null)
            const SizedBox(
              height: 10,
            ),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              style: FontSizes.getContentStyle().copyWith(
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
                body,
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
