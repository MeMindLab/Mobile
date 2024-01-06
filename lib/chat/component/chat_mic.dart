import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class ChatMicArea extends StatelessWidget {
  const ChatMicArea({super.key});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return Container(
        width: double.infinity,
        height: 272.1,
        color: lightTheme.primaryColorDark,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                'assets/image/chat/micBg2.gif',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.cover,
              ),
              Positioned(
                child: SvgPicture.asset('assets/svg/icon/mic.svg', width: 40),
              ),
              Positioned(
                bottom: 20,
                child: Text(
                  '마이크를 입에 가깝게 위치하고 말씀해주세요.\n화면을 터치하면 음성인식이 중단됩니다.',
                  style: FontSizes.getContentStyle().copyWith(
                      color: theme.appColors.seedColor,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ));
  }
}
