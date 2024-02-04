import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/dialog/d_bottom_sheet.dart';
import 'package:me_mind/common/component/dialog/w_bottom_sheet_content.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/user/component/custom_checkbox.dart';
import 'package:me_mind/user/model/terms_model.dart';
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

  Terms terms = Terms();

  bool pwdShow = true;
  String? errorEmailText;
  String? errorNameText;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    Color blueButtonColor = theme.appColors.blueButtonBackground;

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
                        labelText: "이메일",
                        hintText: "example@gamil.com",
                        errorText: errorEmailText,
                        onChanged: (String value) {
                          email = value;
                        },
                        validator: (value) =>
                            CheckValidate().validateEmail(value),
                        borderColor: blueButtonColor,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText: "닉네임",
                        hintText: "닉네임을 입력해주세요",
                        errorText: errorNameText,
                        maxLength: 10,
                        validator: (value) =>
                            CheckValidate().validateName(value),
                        onChanged: (String value) {
                          name = value;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText: "비밀번호",
                        hintText: "비밀번호를 설정해주세요(최소8자)",
                        maxLength: 15,
                        validator: (value) =>
                            CheckValidate().validatePassword(value),
                        obscureText: pwdShow,
                        onChanged: (String value) {
                          pwd = value;
                        },
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                pwdShow = !pwdShow;
                              });
                            },
                            icon: SvgPicture.asset(
                              "assets/svg/icon/pwd.svg",
                              width: 24,
                              height: 24,
                              fit: BoxFit.fitWidth,
                            )),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextFormField(
                        hintText: "비밀번호를 한 번 더 입력해주세요",
                        obscureText: true,
                        onChanged: (String value) {},
                        validator: (value) =>
                            CheckValidate().validateConfirmPassword(pwd, value),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "•  비밀번호는 특수문자 포함 최소8자입니다",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomCheckBox(
                          title: "전체 동의",
                          svg: "check_all.svg",
                          isChecked: terms.all,
                          onChanged: (value) {
                            setState(() {
                              terms = terms.alltoggle(terms, value);
                            });
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomCheckBox(
                          title: "[필수] 서비스 이용약관 동의",
                          svg: "check.svg",
                          isChecked: terms.one,
                          trailing: Text("보기",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          onChanged: (value) {
                            setState(() {
                              terms = terms.onetoggle(terms, value);
                            });
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[필수] 개인정보 수집 및 이용 동의",
                          svg: "check.svg",
                          isChecked: terms.two,
                          trailing: Text("보기",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          onChanged: (value) {
                            setState(() {
                              terms = terms.twotoggle(terms, value);
                            });
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[선택] 앱 Push 수신 동의",
                          svg: "check.svg",
                          isChecked: terms.three,
                          trailing: Text("보기",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          onChanged: (value) {
                            setState(() {
                              terms = terms.threetoggle(terms, value);
                            });
                          }),
                      const SizedBox(
                        height: 9,
                      ),
                      CustomCheckBox(
                          title: "[선택] 광고성 정보 수신 동의",
                          svg: "check.svg",
                          isChecked: terms.four,
                          trailing: Text("보기",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              )),
                          onChanged: (value) {
                            setState(() {
                              terms = terms.fourtoggle(terms, value);
                            });
                          }),
                      const SizedBox(
                        height: 28,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: terms.submitted
                            ? RoundedButton(
                                text: "가입하기",
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    var response = await SignupService()
                                        .signup(email, name, pwd);
                                    print(response.runtimeType);
                                    Type type = response.runtimeType;
                                    if (type == Null) {
                                      setState(() {
                                        errorEmailText = "이미 가입된 이메일 주소입니다";
                                        errorNameText = "이미 존재하는 닉네임입니다";
                                      });
                                    } else if (type == String) {
                                      if (response == "email") {
                                        setState(() {
                                          errorEmailText = "이미 가입된 이메일 주소입니다";
                                        });
                                      }
                                      if (response == "nickname") {
                                        setState(() {
                                          errorNameText = "이미 존재하는 닉네임입니다";
                                        });
                                      }
                                    } else {
                                      if (terms.four == true) {
                                        await BottomSheets(
                                            context: context,
                                            bodies: BottomSheetContent()
                                                .termsAlert(
                                                    title: "광고성 정보 수신동의 처리 결과",
                                                    body:
                                                        "전송자 : memind\n일시 : 20xx년 x월 x일\n내용 : 수신동의 처리 완료",
                                                    action: RoundedButton(
                                                      text: "확인",
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                    ))).show();
                                        await Future.delayed(
                                            Duration(milliseconds: 1000));
                                      }
                                      if (terms.three == true) {
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
