import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool is_submitted;

  @override
  void initState() {
    super.initState();
    is_submitted = true;
  }

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
                          width: 40.0,
                          height: 40.0,
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
                        height: 33,
                      ),
                      CustomTextFormField(
                        labelText: "닉네임",
                        hintText: "닉네임을 입력해주세요",
                        maxLength: 10,
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      CustomTextFormField(
                        labelText: "비밀번호",
                        hintText: "비밀번호를 설정해주세요(최소8자)",
                        maxLength: 8,
                        obscureText: true,
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      CustomTextFormField(
                        hintText: "비밀번호를 한 번 더 입력해주세요",
                        obscureText: true,
                        onChanged: (String value) {},
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
