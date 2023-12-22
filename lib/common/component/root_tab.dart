import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/diary/view/s_diary.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/report/view/s_report.dart';
import 'package:me_mind/settings/view/s_setting.dart';

class RootTab extends StatefulWidget {
  const RootTab({super.key});

  @override
  State<RootTab> createState() => _RootTabState();
}

class _RootTabState extends State<RootTab> {
  Widget getAnimatedContainer(int idx, int pageIdx, BuildContext context,
      String svgAsset, String rootTitle) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 70,
      curve: Curves.fastOutSlowIn,
      height: 70,
      decoration: BoxDecoration(
        color: idx == pageIdx
            ? lightTheme.primaryColor
            : theme.appColors.seedColor,
        shape: BoxShape.circle,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(svgAsset,
              colorFilter: idx == pageIdx
                  ? ColorFilter.mode(
                      theme.appColors.iconButton, BlendMode.srcIn)
                  : null,
              width: 24,
              height: 24),
          const SizedBox(
            height: 5,
          ),
          Text(
            rootTitle,
            style: FontSizes.getCapsuleStyle().copyWith(
                color: idx == pageIdx
                    ? theme.appColors.iconButton
                    : theme.appColors.hintText,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Widget bottom(int idx, BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return BottomAppBar(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 34),
        color: Colors.transparent,
        height: 120,
        elevation: 0.0,
        // 바텀 앱바 흰색 테두리
        child: Container(
          decoration: BoxDecoration(
              color: theme.appColors.seedColor,
              borderRadius: BorderRadius.circular(50)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 바텀 앱바
              // 클릭 색상 Color.fromRGBO(255, 238, 151, 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(0);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const MainScreen()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: getAnimatedContainer(
                        idx, 0, context, 'assets/svg/icon/home.svg', "홈"),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(1);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Report()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: getAnimatedContainer(
                        idx, 1, context, 'assets/svg/icon/report.svg', "리포트"),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(2);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Diary()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: getAnimatedContainer(idx, 2, context,
                        'assets/svg/icon/picture3.svg', "그림일기"),
                  ),
                  InkWell(
                    onTap: () async {
                      await setBottomIdx(3);
                      Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: ((BuildContext context,
                                    Animation<double> animation1,
                                    Animation<double> animation2) =>
                                const Settings()),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    },
                    child: getAnimatedContainer(
                        idx, 3, context, 'assets/svg/icon/setting.svg', "설정"),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
        future: getBottomIdx(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return bottom(snapshot.data, context);
          }
          return bottom(-1, context);
        });
  }
}
