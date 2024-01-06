import 'package:flutter/material.dart';
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
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: isFolded == false
          ? EdgeInsets.fromLTRB(10, 20, 10, 0)
          : EdgeInsets.fromLTRB(10, 0, 10, 0),
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
                const Text(
                    '구르미는 미아인드가 개발한 일기쓰기 전문 인공지능입니다. 텍스트나 음성으로 대화하듯이 하루를 정리해보세요!',
                    maxLines: 2,
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                IconButton(
                  padding: EdgeInsets.zero,
                  icon: isFolded == false
                      ? Icon(Icons.expand_less)
                      : Icon(Icons.keyboard_arrow_down),
                  visualDensity: VisualDensity.compact,
                  onPressed: onPressed,
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: isFolded == false
                        ? Icon(Icons.keyboard_arrow_up)
                        : Icon(Icons.keyboard_arrow_down),
                    onPressed: onPressed,
                  )
                ]),
    );
  }
}
