import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/s_setting.dart';

enum AppTheme { emotion, basic }

class SettingTheme extends StatefulWidget {
  const SettingTheme({super.key});

  @override
  State<SettingTheme> createState() => _SettingThemaState();
}

class _SettingThemaState extends State<SettingTheme> {
  bool isDarkmode = false;
  AppTheme _appTheme = AppTheme.emotion;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
        title: "테마 설정",
        backgroundColor: theme.appColors.userInputBackground,
        appBarBgColor: theme.appColors.userInputBackground,
        appBarLeading: BackArrowLeading(
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
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: theme.appColors.seedColor,
                  borderRadius: BorderRadius.circular(13.0)),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "달력테마",
                      style: FontSizes.getHeadline2Style().copyWith(
                          color: theme.appColors.iconButton,
                          fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      "감정모드",
                      style: FontSizes.getContentStyle().copyWith(
                          color: theme.appColors.iconButton,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 63,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.blue;
                              } else {
                                return Colors.grey;
                              }
                            }),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            value: AppTheme.emotion,
                            groupValue: _appTheme,
                            onChanged: (value) {
                              setState(() {
                                _appTheme = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: _appTheme == AppTheme.emotion
                                            ? theme.appColors.checkColor
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                    "assets/image/theme/emotion.png"))),
                      ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      "기본모드",
                      style: FontSizes.getContentStyle().copyWith(
                          color: theme.appColors.iconButton,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 63,
                      child: Row(children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Radio(
                            fillColor: MaterialStateColor.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.blue;
                              } else {
                                return Colors.grey;
                              }
                            }),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                              vertical: VisualDensity.minimumDensity,
                            ),
                            value: AppTheme.basic,
                            groupValue: _appTheme,
                            onChanged: (value) {
                              setState(() {
                                _appTheme = value!;
                              });
                            },
                          ),
                        ),
                        Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 2,
                                        color: _appTheme == AppTheme.basic
                                            ? theme.appColors.checkColor
                                            : Colors.transparent),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Image.asset(
                                    "assets/image/theme/basic.png"))),
                      ]),
                    ),
                  ]),
            ),
            const SizedBox(
              height: 10,
            ),
          ]),
        ));
  }
}
