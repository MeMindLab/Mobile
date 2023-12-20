import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/user/component/custom_check.dart';

import 'package:me_mind/user/component/custom_checkbox.dart';
import 'package:me_mind/user/component/link_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // ignore: non_constant_identifier_names
  late bool is_submitted = true;

  late bool? passwordValidate;
  late bool isPasswordObscured;

  @override
  void initState() {
    super.initState();

    passwordValidate = false;
    isPasswordObscured = true;
  }

  void toggleObscureText() {
    setState(() {
      isPasswordObscured = !isPasswordObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    Color blueButtonColor = theme.appColors.blueButtonBackground;
    bool isCheckService = false;
    var checkboxValue = false;

    return DefaultLayout(
      title: "회원가입",
      appBarLeading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back,
          color: theme.appColors.iconButton,
        ),
      ),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(
                        height: 23,
                      ),
                      CustomTextFormField(
                        labelText: "이메일",
                        hintText: "example@gamil.com",
                        onChanged: (String value) {},
                        borderColor: blueButtonColor,
                        suffixIcon: Container(
                          width: 24.0,
                          height: 24.0,
                          color: Colors.transparent,
                          child: Center(
                            child: SvgPicture.asset(
                              '$baseImageSvgPath/icon/check.svg',
                              colorFilter: ColorFilter.mode(
                                theme.appColors.blueButtonBackground,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText: "닉네임",
                        hintText: "닉네임을 입력해주세요",
                        maxLength: 10,
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        labelText: "비밀번호",
                        hintText: "비밀번호를 설정해주세요(최소8자)",
                        maxLength: 8,
                        obscureText: isPasswordObscured,
                        onToggleObscureText: toggleObscureText,
                        isToggle: true,
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextFormField(
                        hintText: "비밀번호를 한 번 더 입력해주세요",
                        obscureText: isPasswordObscured,
                        errorText: "",
                        onChanged: (String value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 7.0, horizontal: 9),
                        child: Text(
                          "•  비밀번호는 특수문자 포함 최소8자입니다",
                          style:
                              _getValidationTextStyle(passwordValidate, theme),
                        ),
                      ),
                      const Spacer(),
                      const LinkText(
                        text: "테스트1",
                        url: "",
                        linkColor: Colors.blue,
                      ),
                      const LinkText(
                        text: "테스트1",
                        url: "",
                        textColor: Colors.green,
                      ),
                      CustomCheckBox(
                        title: "전체 동의",
                        onChanged: (bool value) {},
                      ),
                      CustomCheckBox(
                        title: "[필수] 서비스 이용약관 동의",
                        onChanged: (bool value) {},
                      ),
                      CustomCheckBox(
                        title: "[필수] 개인정보 수집 및 이용 동의",
                        onChanged: (bool value) {},
                        trailing: const Text("보기"),
                      ),
                      CustomCheckBox(
                        title: "[선택] 마케팅 수집 및 알림 동의",
                        trailing: const LinkText(
                          text: '보기',
                          url: '',
                        ),
                        onChanged: (bool value) {},
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: is_submitted
                            ? RoundedButton(
                                text: "가입하기",
                                onPressed: () {},
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

TextStyle _getValidationTextStyle(bool? validateResult, CustomTheme theme) {
  if (validateResult == true) {
    return FontSizes.getCapsuleStyle().copyWith(
      color: theme.appColors.checkColor,
    );
  } else if (validateResult == false) {
    return FontSizes.getCapsuleStyle().copyWith(
      color: const Color(0xFFEA3030),
    );
  } else {
    return FontSizes.getCapsuleStyle();
  }
}
