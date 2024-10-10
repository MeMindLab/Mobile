import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class ChatNotification extends StatelessWidget {
  final CustomTheme theme;
  final bool isFolded;
  final VoidCallback onPressed;
  final bool? isArrow;
  final String content;
  final Color? bgColor;
  final Color? foldedButtonColor;

  const ChatNotification(
      {super.key,
      required this.theme,
      required this.isFolded,
      required this.content,
      this.bgColor,
      this.isArrow = false,
      this.foldedButtonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        margin: const EdgeInsets.fromLTRB(20, 10, 15, 0),
        padding: isFolded == false
            ? const EdgeInsets.fromLTRB(16.5, 20, 16.5, 0)
            : EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: isFolded == false
              ? Border.all(width: 2, color: AppColors.blueMain)
              : null,
          color: isFolded == false
              ? bgColor == null
                  ? lightTheme.primaryColor
                  : bgColor!
              : theme.appColors.badgeBorder,
        ),
        child: isFolded == false
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(content,
                      style: FontSizes.getCapsuleStyle()
                          .copyWith(fontSize: 14, fontWeight: FontWeight.w400)),
                  const SizedBox(
                    height: 7,
                  ),
                  InkWell(
                      onTap: onPressed,
                      child: isArrow == true
                          ? Image.asset("assets/image/icon/arrow_up.png")
                          : Text(
                              "닫기",
                              style: FontSizes.getCapsuleHighlightStyle()
                                  .copyWith(
                                      color: AppColors.gray7,
                                      fontWeight: FontWeight.w400),
                            )),
                  const SizedBox(
                    height: 6,
                  ),
                ],
              )
            : const SizedBox());
  }
}
