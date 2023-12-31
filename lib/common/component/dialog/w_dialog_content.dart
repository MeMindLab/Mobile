import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

Widget dialogContent(
    {String? imageLink,
    contentTitleText,
    contentDetailText,
    theme,
    TextAlign? textAlign}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Column(
        children: [
          if (imageLink != null)
            SizedBox(
              width: 90,
              height: 90,
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
                  fontWeight: FontWeight.w600,
                  fontFamily: "Pretendard"),
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
  );
}
