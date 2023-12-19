import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';

class SettingUserInfo extends StatefulWidget {
  const SettingUserInfo({super.key});

  @override
  State<SettingUserInfo> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingUserInfo> {
  final _formKey = GlobalKey<FormState>();
  late Timer _timer;
  bool isUpdated = false;
  bool isphoneAuthenticated = false;
  bool isTimerStart = false;
  int timerCount = 14;

  void _startTimer() {
    if (false == isTimerStart) {
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCount <= 0) {
          _timer.cancel();
        } else {
          setState(() {
            timerCount--;
          });
        }
      });
      isTimerStart = true;
    }
  }

  // form onSaved need
  // form validate need?
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
        title: "계정정보",
        backgroundColor: theme.appColors.seedColor,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: theme.appColors.userInputBackground,
                              borderRadius: BorderRadius.circular(13.0)),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 49.5),
                                child: SvgPicture.asset(
                                  '${baseImageSvgPath}/icon/logo.svg',
                                ),
                              ),
                              const SizedBox(
                                height: 54,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "구르미조아",
                                bgColor: theme.appColors.seedColor,
                                labelText: "닉네임",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "1234",
                                bgColor: theme.appColors.seedColor,
                                labelText: "비밀번호",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "brainz.paek@gmail.com",
                                bgColor: theme.appColors.seedColor,
                                labelText: "이메일",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                bgColor: theme.appColors.seedColor,
                                labelText: "연락처",
                                hintText: "번호를 입력해주세요",
                                onChanged: (String value) {},
                                suffixWidget: isUpdated
                                    ? Container(
                                        width: 83,
                                        height: 35,
                                        // padding: const EdgeInsets.fromLTRB(
                                        //     0, 10, 0, 10),
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: SizedBox(
                                          width: double.infinity,
                                          height: double.infinity,
                                          child: RoundedButton(
                                            text: "인증요청",
                                            foregroundColor:
                                                theme.appColors.iconButton,
                                            backgroundColor:
                                                lightTheme.primaryColor,
                                            onPressed: () {
                                              if (isUpdated == true) {
                                                setState(() {
                                                  isphoneAuthenticated = true;
                                                });
                                                _startTimer();
                                              }
                                            },
                                          ),
                                        ),
                                      )
                                    : null,
                              ),
                              if (isphoneAuthenticated == true)
                                Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SeetingCustomTextFormField(
                                      bgColor: theme.appColors.seedColor,
                                      onChanged: (String value) {},
                                      suffixWidget: Align(
                                        alignment: Alignment.centerRight,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 20),
                                          child: Text(
                                            "0${timerCount ~/ 60}"
                                                    .padLeft(2, "0") +
                                                ":" +
                                                "${timerCount % 60}"
                                                    .padLeft(2, "0"),
                                            style: FontSizes.getContentStyle()
                                                .copyWith(color: Colors.red),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        isUpdated == false
                            ? SizedBox(
                                width: double.infinity,
                                child: RoundedButton(
                                  text: "수정",
                                  onPressed: () {
                                    setState(() {
                                      isUpdated = true;
                                    });
                                  },
                                ),
                              )
                            : isTimerStart == false
                                ? SizedBox(
                                    width: double.infinity,
                                    child: RoundedButton(
                                      text: "저장",
                                      backgroundColor:
                                          theme.appColors.grayButtonBackground,
                                      onPressed: () {},
                                    ),
                                  )
                                : SizedBox(
                                    width: double.infinity,
                                    child: RoundedButton(
                                      text: "저장",
                                      backgroundColor:
                                          theme.appColors.blueButtonBackground,
                                      onPressed: () {
                                        _timer.cancel();
                                        setState(() {
                                          isUpdated = false;
                                          isphoneAuthenticated = false;
                                        });
                                      },
                                    ),
                                  ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (isUpdated == false)
                          Text(
                            "계정 탈퇴하기",
                            style: FontSizes.getCapsuleStyle()
                                .copyWith(color: theme.appColors.iconButton),
                          )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
