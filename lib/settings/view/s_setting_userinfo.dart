import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:intl/intl.dart';
import 'dart:math';

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
    return DefaultLayout(
        title: "계정정보",
        backgroundColor: AppColors.whiteColor,
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
                              color: AppColors.blue1,
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
                                bgColor: Colors.white,
                                labelText: "닉네임",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "1234",
                                bgColor: Colors.white,
                                labelText: "비밀번호",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "brainz.paek@gmail.com",
                                bgColor: Colors.white,
                                labelText: "이메일",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                bgColor: Colors.white,
                                labelText: "연락처",
                                hintText: "번호를 입력해주세요",
                                onChanged: (String value) {},
                                suffixWidget: isUpdated == true
                                    ? Container(
                                        width: 83,
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 10),
                                        margin:
                                            const EdgeInsets.only(right: 15),
                                        child: RoundedButton(
                                          height: 35,
                                          text: "인증요청",
                                          foregroundColor: AppColors.blue8,
                                          backgroundColor: AppColors.yellow,
                                          onPressed: () {
                                            if (isUpdated == true) {
                                              setState(() {
                                                isphoneAuthenticated = true;
                                              });
                                              _startTimer();
                                            }
                                          },
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
                                      bgColor: Colors.white,
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
                                            style: const TextStyle(
                                                color: Colors.red,
                                                fontSize: 16),
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
                            ? RoundedButton(
                                text: "수정",
                                onPressed: () {
                                  setState(() {
                                    isUpdated = true;
                                  });
                                },
                              )
                            : isTimerStart == false
                                ? RoundedButton(
                                    text: "저장",
                                    backgroundColor: AppColors.gray3,
                                    onPressed: () {},
                                  )
                                : RoundedButton(
                                    text: "저장",
                                    backgroundColor: AppColors.blue5,
                                    onPressed: () {
                                      _timer.cancel();
                                      setState(() {
                                        isUpdated = false;
                                        isphoneAuthenticated = false;
                                      });
                                    },
                                  ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (isUpdated == false)
                          const Text(
                            "계정 탈퇴하기",
                            style: TextStyle(color: AppColors.blue7),
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
