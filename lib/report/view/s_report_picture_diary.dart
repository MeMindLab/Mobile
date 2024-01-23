import 'package:flutter/material.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class ReportPictureDiary extends StatefulWidget {
  const ReportPictureDiary({super.key});

  @override
  State<ReportPictureDiary> createState() => _ReportPictureDiaryState();
}

class _ReportPictureDiaryState extends State<ReportPictureDiary> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
      title: "그림일기",
      bottomNavigationBar: const RootTab(),
      appBarLeading: const BackArrowLeading(),
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.21,
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.grey.shade300,
              BlendMode.modulate,
            ),
            child: Image.asset(
              "assets/image/emotion/black_happiness.png",
              width: 93,
              height: 93,
              fit: BoxFit.fitWidth,
            ),
          ),
          const SizedBox(
            height: 19,
          ),
          Text(
            "열심히 준비중 입니다.\n조금만 기다려주세요!",
            textAlign: TextAlign.center,
            style: FontSizes.getContentStyle().copyWith(
                fontWeight: FontWeight.w400, color: theme.appColors.hintText),
          ),
        ]),
      ),
    );
  }
}
