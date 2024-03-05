import 'package:flutter/material.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/user/services/login_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";

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
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    final AuthService authService = AuthService(); // AuthService 인스턴스 생성

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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 27),
                          child: Image.asset(
                            "assets/image/logo/logo.png",
                            width: 62,
                            height: 62,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          labelText: "이메일",
                          errorText: "아이디 혹은 비밀번호가 다릅니다.",
                          onChanged: (String value) {
                            email = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "이메일을 입력해주세요!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        CustomTextFormField(
                          labelText: "비밀번호",
                          obscureText: true,
                          errorText: "아이디 혹은 비밀번호가 다릅니다.",
                          isToggle: true,
                          onToggleObscureText: () {},
                          onChanged: (String value) {
                            password = value;
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "비밀번호를 입력해주세요!";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        RoundedButton(
                          text: "로그인",
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              final response = await authService.loginService
                                  .login(email, password);

                              // 추후 토큰 저장 및 관리
                              final refreshToken = response.result.refreshToken;
                              final accessToken = response.result.accessToken;

                              await storage.write(
                                  key: ACCESS_TOKEN, value: accessToken);
                              await storage.write(
                                  key: REFRESH_TOKEN, value: refreshToken);

                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const MainScreen(),
                                ),
                              );
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: Text(
                            "비밀번호를 잊으셨습니까?",
                            style: FontSizes.getCapsuleStyle().copyWith(
                              color: theme.appColors.hintText,
                            ),
                          ),
                        ),
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
