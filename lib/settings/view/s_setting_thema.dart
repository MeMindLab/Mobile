import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/s_setting.dart';

class SettingThema extends StatefulWidget {
  const SettingThema({super.key});

  @override
  State<SettingThema> createState() => _SettingThemaState();
}

class _SettingThemaState extends State<SettingThema> {
  bool isDarkmode = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
        title: "설정",
        backgroundColor: theme.appColors.userInputBackground,
        appBarActions: [
          Container(
            margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: [
                //SvgPicture.asset('assets/svg/icon/vitamin.svg'),
                Text(
                  '10',
                  style: FontSizes.getHeadline1Style()
                      .copyWith(color: theme.appColors.iconButton),
                ),
              ],
            ),
          ),
        ],
        appBarLeading: IconButton(
          onPressed: () async {
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
          icon: const Icon(Icons.arrow_back),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            // 달력테마
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: theme.appColors.seedColor),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "달력테마",
                      style: FontSizes.getHeadline2Style()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "감정모드",
                      style: FontSizes.getContentStyle()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 97,
                      decoration: BoxDecoration(
                          color: theme.appColors.grayButtonBackground,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "기본모드",
                      style: FontSizes.getContentStyle()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: double.infinity,
                      height: 97,
                      decoration: BoxDecoration(
                          color: theme.appColors.grayButtonBackground,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 20,
            ),
            //다크 모드
            Container(
              height: 65,
              decoration: BoxDecoration(color: theme.appColors.seedColor),
              padding: const EdgeInsets.all(20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "다크모드",
                      style: FontSizes.getHeadline2Style()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                    Switch(
                      value: isDarkmode,
                      activeColor: theme.appColors.grayButtonBackground,
                      onChanged: (bool value) {
                        setState(() {
                          isDarkmode = !isDarkmode;
                        });
                      },
                    ),
                  ]),
            ),
          ]),
        ));
  }
}
