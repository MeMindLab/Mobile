import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

// 기본 버튼, isRow==false일떄
Widget alertDialogButton(
    {required CustomTheme theme,
    required Color bgColor,
    required String content,
    required VoidCallback onSubmit}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: TextButton(
        style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
        child: Text(content,
            style: FontSizes.getCapsuleStyle()
                .copyWith(color: theme.appColors.iconButton)),
        onPressed: onSubmit),
  );
}

// text 클릭시
Widget clickText(
    {required CustomTheme theme,
    required String content,
    required VoidCallback onSubmit}) {
  return SizedBox(
    width: double.infinity,
    child: Center(
      child: InkWell(
        onTap: onSubmit,
        child: Text(
          content,
          style: FontSizes.getCapsuleStyle()
              .copyWith(color: theme.appColors.hintText),
        ),
      ),
    ),
  );
}

// isrow == true일때 사용할 버튼
Widget multiChoiceButton(
    {required CustomTheme theme,
    required Color bgColor,
    required String content,
    required VoidCallback onSubmit}) {
  return Expanded(
    child: Container(
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: TextButton(
          style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
          child: Text(content,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(color: theme.appColors.iconButton)),
          onPressed: onSubmit),
    ),
  );
}

// isRow==true일때 좁은 너비 버튼
Widget multiChoiceNarrowButton(
    {required BuildContext context,
    required CustomTheme theme,
    required Color bgColor,
    required String content,
    required VoidCallback onSubmit}) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.19,
    decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(10))),
    child: TextButton(
        style: TextButton.styleFrom(shadowColor: theme.appColors.badgeBorder),
        child: Text(content,
            style: FontSizes.getCapsuleStyle()
                .copyWith(color: theme.appColors.iconButton)),
        onPressed: onSubmit),
  );
}
