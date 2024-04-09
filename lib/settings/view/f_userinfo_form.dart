import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/dialog/d_alert_dialog.dart';
import 'package:me_mind/common/component/dialog/d_multichoice_dialog.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/view/splash_screen.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/utils/phone_number_formatter.dart';
import 'package:me_mind/settings/view/w_certify_timer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoForm extends StatefulWidget {
  bool isUpdate;
  Function onUpdate;
  VoidCallback handlePhoneAuth;
  final String userEmail;
  final String userNickname;
  UserInfoForm(
      {super.key,
      required this.isUpdate,
      required this.onUpdate,
      required this.handlePhoneAuth,
      required this.userEmail,
      required this.userNickname});

  @override
  State<UserInfoForm> createState() => _UserInfoFormState();
}

class _UserInfoFormState extends State<UserInfoForm> {
  final _formKey = GlobalKey<FormState>();

  String phoneNumber = "";
  String nickname = "";
  String email = "";
  int timerCount = 300;
  late Timer _timer;
  late CertifyTimer certifyTimer;
  bool isphoneAuthenticated = false;
  bool isTimerStart = false;
  bool isAuthenticComplete = false;

  void resetTimer() {
    setState(() {
      _timer.cancel();
      timerCount = 300;
      isphoneAuthenticated = false;
      isTimerStart = false;
    });
  }

  void _startTimer(BuildContext context, theme) {
    timerCount = 300;
    if (false == isTimerStart) {
      setState(() {
        isTimerStart = true;
      });
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        print(timerCount);
        if (timerCount <= 0) {
          _timer.cancel();
          AlertDialogs(
              context: context,
              title: "인증번호 입력시간이 초과되었습니다.",
              actions: [
                AlertDialogButton(
                  theme: theme,
                  bgColor: lightTheme.primaryColor,
                  content: "확인",
                  onSubmit: () {
                    Navigator.pop(context);
                  },
                ),
              ]).show();
          resetTimer();
        } else {
          if (isTimerStart == true) {
            setState(() {
              timerCount--;
            });
          } else {
            _timer.cancel();
            setState(() {
              timerCount = 300;
            });
          }
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.userEmail);
    certifyTimer = CertifyTimer(timerCount: timerCount);
    nickname = "구르미조아";
    email = "";
    _timer = Timer(const Duration(seconds: 0), () {});
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final deviceWidth = MediaQuery.of(context).size.width;

    return Form(
      key: _formKey,
      child: Column(children: [
        Container(
          decoration: BoxDecoration(
              color: theme.appColors.userInputBackground,
              borderRadius: BorderRadius.circular(13.0)),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28.5),
                child: Image.asset(
                  'assets/image/logo/logo.png',
                  width: 46,
                  height: 46,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SeetingCustomTextFormField(
                initialText: widget.userNickname,
                bgColor: theme.appColors.seedColor,
                maxLength: 10,
                labelText: "닉네임",
                readOnly: widget.isUpdate == false ? true : false,
                onChanged: (String value) {
                  setState(() {
                    nickname = value;
                  });
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              SeetingCustomTextFormField(
                initialText: widget.userEmail,
                bgColor: theme.appColors.seedColor,
                labelText: "이메일",
                readOnly: widget.isUpdate == false ? true : false,
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              const SizedBox(
                height: 12.0,
              ),
              SeetingCustomTextFormField(
                bgColor: theme.appColors.seedColor,
                labelText: "연락처",
                enabled: !isphoneAuthenticated,
                textInputFormatter: [PhoneNumberFormatter()],
                hintText: isAuthenticComplete ? phoneNumber : "번호를 입력해주세요",
                readOnly: widget.isUpdate == false ? true : false,
                suffixWidget: widget.isUpdate && isAuthenticComplete == false
                    ? Container(
                        width: 83,
                        height: 35,
                        margin: EdgeInsets.fromLTRB(0, 5, 7, 5),
                        child: ElevatedButton(
                          child: Text(
                            isphoneAuthenticated ? "재전송" : "인증요청",
                            style: FontSizes.getContentStyle()
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            if (isphoneAuthenticated == false) {
                              setState(() {
                                isphoneAuthenticated = true;
                              });
                              _startTimer(context, theme);
                            } else {
                              setState(() {
                                isTimerStart = false;
                              });
                              _timer.cancel();
                              _startTimer(context, theme);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: EdgeInsets.zero,
                            backgroundColor: lightTheme.primaryColor,
                            elevation: 0,
                            foregroundColor: theme.appColors.iconButton,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                          ),
                        ),
                      )
                    : null,
                onChanged: (String value) {
                  setState(() {
                    phoneNumber = value;
                  });
                },
              ),
              isphoneAuthenticated == false
                  ? const SizedBox(
                      height: 20,
                    )
                  : const SizedBox(height: 10),
              isphoneAuthenticated
                  ? SizedBox(
                      width: deviceWidth,
                      child: isAuthenticComplete == false
                          ? Stack(children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: SeetingCustomTextFormField(
                                      bgColor: theme.appColors.seedColor,
                                      maxLength: 4,
                                      onChanged: (String value) {},
                                      validator: (value) {
                                        if (value != "1234") {
                                          return "인증번호를 확인해주세요";
                                        }
                                        return null;
                                      },
                                      suffixWidget: Align(
                                        widthFactor: 1.0,
                                        heightFactor: 1.0,
                                        child: CertifyTimer(
                                          timerCount: timerCount,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.21,
                                  ),
                                ],
                              ),
                              Positioned(
                                top: 10,
                                right: 0,
                                child: Container(
                                  width: 75,
                                  height: 35,
                                  child: ElevatedButton(
                                    child: Text(
                                      "확인",
                                      style: FontSizes.getContentStyle()
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        _timer.cancel();
                                        setState(() {
                                          timerCount = 300;
                                          isAuthenticComplete = true;
                                        });
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      minimumSize: Size.zero,
                                      padding: EdgeInsets.zero,
                                      backgroundColor:
                                          theme.appColors.grayButtonBackground,
                                      elevation: 0,
                                      foregroundColor:
                                          theme.appColors.iconButton ??
                                              Colors.black,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(13),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ])
                          : SizedBox(
                              width: deviceWidth,
                              child: SeetingCustomTextFormField(
                                bgColor: theme.appColors.seedColor,
                                initialText: "1234",
                                maxLength: 4,
                                onChanged: (String value) {},
                                suffixWidget: SizedBox(
                                  child: SvgPicture.asset(
                                    'assets/svg/icon/check.svg',
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                        Colors.blue, BlendMode.srcIn),
                                  ),
                                ),
                              ),
                            ))
                  : SizedBox(),
              isphoneAuthenticated ? const SizedBox(height: 20) : SizedBox(),
            ],
          ),
        ),
        const SizedBox(
          height: 14,
        ),
        widget.isUpdate == false
            ? SizedBox(
                width: double.infinity,
                child: RoundedButton(
                  text: "수정",
                  onPressed: () {
                    widget.onUpdate(true);
                  },
                ),
              )
            : Row(children: [
                SizedBox(
                  width: deviceWidth * 0.3,
                  child: RoundedButton(
                    borderSide: BorderSide(
                        width: 1, color: theme.appColors.grayButtonBackground),
                    text: "취소",
                    backgroundColor: theme.appColors.seedColor,
                    onPressed: () {
                      widget.onUpdate(false);
                      resetTimer();
                    },
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: SizedBox(
                    child: RoundedButton(
                      backgroundColor: isAuthenticComplete == true
                          ? theme.appColors.blueButtonBackground
                          : theme.appColors.grayButtonBackground,
                      text: "저장",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print({
                            "nickname": nickname,
                            "email": email,
                            "phoneNumber": phoneNumber,
                            "is_auth": isphoneAuthenticated,
                          });
                          // api 통신 후 200
                          widget.onUpdate(false);
                          setState(() {
                            isphoneAuthenticated = false;
                          });
                          if (isAuthenticComplete == true) {
                            final SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            await prefs.setBool("is_auth", true);
                            widget.handlePhoneAuth();
                            MultiChoiceDialog(
                                context: context,
                                imageAddr:
                                    "assets/image/icon/shining_lemon.png",
                                title: "번호인증을 완료했어요!",
                                body: "비타민이 지급되었습니다.",
                                isNarrow: true,
                                isRow: true,
                                actions: [
                                  AlertDialogButton(
                                      theme: theme,
                                      bgColor:
                                          theme.appColors.grayButtonBackground,
                                      content: "닫기",
                                      onSubmit: () {
                                        Navigator.pop(context);
                                      }),
                                  AlertDialogButton(
                                      theme: theme,
                                      bgColor: lightTheme.primaryColor,
                                      content: "리포트 발행하러 가기",
                                      onSubmit: () async {
                                        await setBottomIdx(2);
                                        Navigator.push(
                                            context,
                                            PageRouteBuilder(
                                              pageBuilder:
                                                  ((BuildContext context,
                                                          Animation<double>
                                                              animation1,
                                                          Animation<double>
                                                              animation2) =>
                                                      MainScreen()),
                                              transitionDuration: Duration.zero,
                                              reverseTransitionDuration:
                                                  Duration.zero,
                                            ));
                                      }),
                                ]).show();
                          }
                        }
                      },
                    ),
                  ),
                )
              ]),
        const Spacer(),
        widget.isUpdate == false
            ? InkWell(
                onTap: () {
                  MultiChoiceDialog(
                      imageAddr: "assets/image/logo/crying_logo.png",
                      context: context,
                      title: "떠나신다니요..",
                      body: "미마인드에서 작성해온\n모든 대화내역들이 삭제돼요.\n그래도 정말 탈퇴하시겠어요?",
                      isRow: false,
                      actions: [
                        AlertDialogButton(
                            theme: theme,
                            bgColor: lightTheme.primaryColor,
                            content: "취소하기",
                            onSubmit: () {
                              Navigator.pop(context);
                            }),
                        AlertDialogButton(
                            theme: theme,
                            bgColor: theme.appColors.seedColor,
                            content: "그래도 탈퇴할게요.",
                            onSubmit: () async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove('isTutorial');
                              await storage.deleteAll();
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SplashScreen()));
                            }),
                      ]).show();
                },
                child: Text(
                  "계정 탈퇴하기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.iconBook),
                ),
              )
            : const Text(""),
      ]),
    );
  }
}
