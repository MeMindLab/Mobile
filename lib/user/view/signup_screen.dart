import 'package:flutter/material.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

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
                          "• 비밀번호는 특수문자 포함 최소8자입니다",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 32),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                theme.appColors.grayButtonBackground,
                            foregroundColor: Colors.black,
                            padding: const EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13),
                            ),
                            minimumSize: const Size(double.infinity, 55),
                          ),
                          child: const Text("가입하기"),
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
