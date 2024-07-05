import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class ChatNotification extends StatelessWidget {
  final CustomTheme theme;
  final bool isFolded;
  final VoidCallback onPressed;
  final String content;
  final Color? bgColor;
  final Color? foldedButtonColor;

  const ChatNotification(
      {super.key,
      required this.theme,
      required this.isFolded,
      required this.content,
      this.bgColor,
      this.foldedButtonColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 10, 15, 0),
      padding: isFolded == false
          ? const EdgeInsets.fromLTRB(15, 20, 15, 0)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.blueMain, width: 1.5),
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
                  child: SvgPicture.asset(
                    'assets/svg/chat/arrow_up.svg',
                    colorFilter: ColorFilter.mode(
                        theme.appColors.activate, BlendMode.srcIn),
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  const SizedBox(
                    height: 4,
                  ),
                  InkWell(
                    onTap: onPressed,
                    child: SvgPicture.asset(
                      'assets/svg/chat/arrow_down.svg',
                      colorFilter: ColorFilter.mode(
                          foldedButtonColor == null
                              ? theme.appColors.activate
                              : foldedButtonColor!,
                          BlendMode.srcIn),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ]),
    );
  }
}
