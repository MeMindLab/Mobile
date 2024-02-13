import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class Trash extends StatelessWidget {
  const Trash({super.key});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
      title: "감정 쓰레기통",
      foregroundColor: Colors.white,
      appBarBgColor: lightTheme.primaryColorDark,
      appBarLeading: Icon(Icons.keyboard_backspace),
      backgroundColor: lightTheme.primaryColorDark,
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
        ),
        Center(
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
            ],
          ),
        ),
      ]),
    );
  }
}
