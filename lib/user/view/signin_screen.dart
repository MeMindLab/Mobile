import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/user/component/custom_checkbox.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final bool _isChecked = false;
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "로그인",
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 49.5),
                        child: SvgPicture.asset(
                          '$baseImageSvgPath/icon/logo.svg',
                        ),
                      ),
                      const SizedBox(
                        height: 54,
                      ),
                      CustomTextFormField(
                        labelText: "이메일",
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      CustomTextFormField(
                        labelText: "비밀번호",
                        obscureText: true,
                        onChanged: (String value) {},
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RoundedButton(
                        text: "가입하기",
                        onPressed: () {},
                      ),
                      CustomCheckBox(
                        title: '자동로그인에 동의합니다 ',
                        onChanged: (bool isChecked) {
                          // 부모 위젯에서 체크 상태에 따른 로직 추가
                          print('Checkbox is checked: $isChecked');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
