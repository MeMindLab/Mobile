import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class ChatNotification extends StatelessWidget {
  final CustomTheme theme;
  final bool isFolded;
  final VoidCallback onPressed;
  const ChatNotification(
      {super.key,
      required this.theme,
      required this.isFolded,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 10, 15, 20),
      padding: isFolded == false
          ? const EdgeInsets.fromLTRB(15, 20, 15, 0)
          : EdgeInsets.zero,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: isFolded == false
            ? lightTheme.primaryColor
            : theme.appColors.badgeBorder,
      ),
      child: isFolded == false
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                    '구르미는 미아인드가 개발한 일기쓰기 전문 인공지능입니다. 텍스트나 음성으로 대화하듯이 하루를 정리해보세요!',
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
                          theme.appColors.activate, BlendMode.srcIn),
                      width: 20,
                      height: 20,
                    ),
                  ),
                ]),
    );
  }
}
