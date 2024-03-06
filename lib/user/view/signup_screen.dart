import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/dialog/d_bottom_sheet.dart';
import 'package:me_mind/common/component/dialog/w_bottom_sheet_content.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/user/component/custom_checkbox.dart';
import 'package:me_mind/user/services/signup_service.dart';
import 'package:me_mind/user/view/s_signup_welcome.dart';
import 'package:me_mind/utils/permission.dart';
import 'package:me_mind/utils/validate.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  String pwd = "";
  String brandName = "memind";

  bool emailCheck = false;
  bool nicknameCheck = false;
  bool pwdShow = true;
  String? errorEmailText;
  String? errorNameText;

  bool isSubmitted = false;
  bool isAll = false;
  bool isService = false;
  bool isPersonalInfo = false;
  bool isAppPush = false;
  bool isAdvertising = false;

  void onTermsChange(String name, bool isTrue) {
    switch (name) {
      case "all":
        setState(() {
          isAll = isTrue;
          isService = isTrue;
          isPersonalInfo = isTrue;
          isAppPush = isTrue;
          isAdvertising = isTrue;
        });
      case "service":
        setState(() {
          isService = isTrue;
        });
      case "personal":
        setState(() {
          isPersonalInfo = isTrue;
        });
      case "appPush":
        setState(() {
          isAppPush = isTrue;
        });
      case "advertise":
        setState(() {
          isAdvertising = isTrue;
        });
    }
    if (isService && isPersonalInfo && isAppPush && isAdvertising) {
      setState(() {
        isAll = true;
      });
    } else {
      setState(() {
        isAll = false;
      });
    }
    if (isService == true && isPersonalInfo == true) {
      setState(() {
        isSubmitted = true;
      });
    } else if (isAll) {
      setState(() {
        isSubmitted = true;
      });
    } else {
      setState(() {
        isSubmitted = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
      title: "회원가입",
      appBarLeading: const BackArrowLeading(),
      backgroundColor: Colors.white,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      CustomTextFormField(
                        isLogin: true,
                        labelText: "이메일",
                        hintText: "example@gamil.com",
                        errorText: errorEmailText,
                        onChanged: (String value) {
                          email = value;
                        },
                        validator: (value) {
                          var emailResult =
                              CheckValidate().validateEmail(value);
                          if (emailResult == null) {
                            setState(() {
                              emailCheck = true;
                            });
                          } else {
                            setState(() {
                              emailCheck = false;
                            });
                          }
                          return emailResult;
                        },
                        suffixIcon: emailCheck == true
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(
                                  "assets/svg/icon/check_all.svg",
                                  width: 24,
                                  height: 24,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: ColorFilter.mode(
                                      Colors.blue, BlendMode.srcIn),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        isLogin: true,
                        labelText: "닉네임",
                        hintText: "닉네임을 입력해주세요",
                        errorText: errorNameText,
                        maxLength: 10,
                        validator: (value) {
                          var nicknameResult =
                              CheckValidate().validateName(value);
                          if (nicknameResult == null) {
                            setState(() {
                              nicknameCheck = true;
                            });
                          } else {
                            setState(() {
                              nicknameCheck = false;
                            });
                          }
                          return nicknameResult;
                        },
                        onChanged: (String value) {
                          name = value;
                        },
                        suffixIcon: nicknameCheck == true
                            ? Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: SvgPicture.asset(
                                  "assets/svg/icon/check_all.svg",
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.scaleDown,
                                  colorFilter: ColorFilter.mode(
                                      Colors.blue, BlendMode.srcIn),
                                ),
                              )
                            : null,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        isLogin: true,
                        labelText: "비밀번호",
                        hintText: "비밀번호를 설정해주세요(최소8자)",
                        maxLength: 15,
                        validator: (value) =>
                            CheckValidate().validatePassword(value),
                        obscureText: pwdShow,
                        onChanged: (String value) {
                          pwd = value;
                        },
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: SizedBox(
                            width: 24,
                            height: 24,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    pwdShow = !pwdShow;
                                  });
                                },
                                icon: pwdShow == true
                                    ? Icon(
                                        Icons.visibility_off,
                                        color: theme.appColors.iconBook,
                                      )
                                    : Icon(
                                        Icons.visibility,
                                        color: theme.appColors.iconBook,
                                      )),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        isLogin: true,
                        hintText: "비밀번호를 한 번 더 입력해주세요",
                        obscureText: pwdShow,
                        onChanged: (String value) {},
                        validator: (value) =>
                            CheckValidate().validateConfirmPassword(pwd, value),
                      ),
                      const Spacer(),
                      CustomCheckBox(
                          title: "전체 동의",
                          isBold: true,
                          svg: "check_all.svg",
                          isChecked: isAll,
                          onChanged: (value) {
                            onTermsChange("all", !isAll);
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomCheckBox(
                          title: "[필수] 서비스 이용약관 동의",
                          svg: "check.svg",
                          isChecked: isService,
                          trailing: Text("보기",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  decoration: TextDecoration.underline,
                                  color: theme.appColors.hintText)),
                          onChanged: (value) {
                            onTermsChange("service", !isService);
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[필수] 개인정보 수집 및 이용 동의",
                          svg: "check.svg",
                          isChecked: isPersonalInfo,
                          trailing: Text("보기",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  decoration: TextDecoration.underline,
                                  color: theme.appColors.hintText)),
                          onChanged: (value) {
                            onTermsChange("personal", !isPersonalInfo);
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[선택] 앱 Push 수신 동의",
                          svg: "check.svg",
                          isChecked: isAppPush,
                          trailing: Text("보기",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  decoration: TextDecoration.underline,
                                  color: theme.appColors.hintText)),
                          onChanged: (value) {
                            onTermsChange("appPush", !isAppPush);
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[선택] 광고성 정보 수신 동의",
                          svg: "check.svg",
                          isChecked: isAdvertising,
                          trailing: Text("보기",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  decoration: TextDecoration.underline,
                                  color: theme.appColors.hintText)),
                          onChanged: (value) {
                            onTermsChange("advertise", !isAdvertising);
                          }),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: isSubmitted
                            ? RoundedButton(
                                text: "가입하기",
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    var response = await SignupService()
                                        .signup(email, name, pwd);
                                    print("회원가입:$response");
                                    Type type = response.runtimeType;
                                    if (type == String) {
                                      if (response == "email") {
                                        setState(() {
                                          errorEmailText = "이미 가입된 이메일 주소입니다";
                                          emailCheck = false;
                                        });
                                      } else if (response == "nickname") {
                                        setState(() {
                                          errorNameText = "이미 존재하는 닉네임입니다";
                                          nicknameCheck = false;
                                        });
                                      } else {
                                        setState(() {
                                          errorEmailText = "이미 가입된 이메일 주소입니다";
                                          errorNameText = "이미 존재하는 닉네임입니다";
                                        });
                                      }
                                    } else {
                                      if (isAdvertising == true) {
                                        String today =
                                            DateFormat("yyyy년 MM월 dd일")
                                                .format(DateTime.now());
                                        await BottomSheets(
                                            context: context,
                                            bodies: BottomSheetContent(
                                                title: "광고성 정보 수신동의 처리 결과",
                                                body:
                                                    "전송자 : $brandName\n일시 : ${today}\n내용 : 수신동의 처리 완료",
                                                action: RoundedButton(
                                                  text: "확인",
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ))).show();
                                        await Future.delayed(
                                            Duration(milliseconds: 1000));
                                      }
                                      if (isAppPush == true) {
                                        var permissonStatus =
                                            await DevicePermission()
                                                .accessNotification();
                                        if (permissonStatus != null) {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      SignUpWelcome()));
                                        }
                                      }
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => SignUpWelcome()));
                                    }
                                  }
                                },
                              )
                            : RoundedButton(
                                text: "가입하기",
                                onPressed: () {},
                                backgroundColor:
                                    theme.appColors.grayButtonBackground,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
