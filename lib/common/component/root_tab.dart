import 'dart:io';

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
  Widget bottom(int idx, BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return SafeArea(
      bottom: true,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 19),
        height: 66,
        margin: EdgeInsets.only(bottom: Platform.isAndroid ? 16 : 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
        ),
        child: BottomAppBar(
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            elevation: 0.0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(
                  width: 1,
                  color: theme.appColors.grayButtonBackground,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(212, 215, 225, 0.25),
                    offset: Offset(0.0, -2.0),
                    blurRadius: 4.0,
                  )
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      bottomNavItem(
                          theme, 'assets/svg/icon/home.svg', idx == 0, "홈",
                          onTap: () => onNavTap(0)),
                      bottomNavItem(
                          theme, 'assets/svg/icon/report.svg', idx == 1, "리포트",
                          onTap: () => onNavTap(1)),
                      bottomNavItem(theme, 'assets/svg/icon/picture3.svg',
                          idx == 2, "그림일기",
                          onTap: () => onNavTap(2)),
                      bottomNavItem(
                          theme, 'assets/svg/icon/setting.svg', idx == 3, "설정",
                          onTap: () => onNavTap(3)),
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Widget bottomNavItem(
      CustomTheme theme, String svgAsset, bool isSelected, String title,
      {Function()? onTap}) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          isSelected
              ? AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: lightTheme.primaryColor),
                )
              : const SizedBox(),
          InkWell(
            onTap: onTap,
            child: Column(children: [
              SvgPicture.asset(svgAsset,
                  colorFilter: isSelected
                      ? ColorFilter.mode(
                          theme.appColors.iconButton, BlendMode.srcIn)
                      : null,
                  width: 24,
                  height: 24),
              const SizedBox(
                height: 4,
              ),
              Text(
                title,
                style: FontSizes.getCapsuleStyle().copyWith(
                    color: isSelected
                        ? theme.appColors.iconButton
                        : theme.appColors.hintText,
                    fontWeight: FontWeight.w500),
              )
            ]),
          ),
        ],
      ),
    );
  }

  void onNavTap(int index) async {
    List<Widget> pageName = [
      const MainScreen(),
      const Report(),
      const Diary(),
      const Settings()
    ];
    await setBottomIdx(index);
    Navigator.push(
        context,
        PageRouteBuilder(
          pageBuilder: ((BuildContext context, Animation<double> animation1,
                  Animation<double> animation2) =>
              pageName[index]),
          transitionDuration: Duration.zero,
          reverseTransitionDuration: Duration.zero,
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
