import 'package:flutter/cupertino.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class DiaryFragment extends StatelessWidget {
  const DiaryFragment({super.key});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return Center(
      child: Column(children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.21,
        ),
        Image.asset(
          "assets/image/emotion/happiness_black.png",
          width: 93,
          height: 93,
          fit: BoxFit.fitWidth,
        ),
        const SizedBox(
          height: 19,
        ),
        Text(
          "열심히 준비중 입니다.\n조금만 기다려주세요!",
          textAlign: TextAlign.center,
          style: FontSizes.getContentStyle().copyWith(
            fontWeight: FontWeight.w400,
            color: theme.appColors.hintText,
          ),
        ),
      ]),
    );
  }
}
