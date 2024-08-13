import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/model/user_info_model.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';
import 'package:me_mind/user/services/login_service.dart';
import 'package:me_mind/user/view/signup_screen.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  final _formKey = GlobalKey<FormState>();

  String email = "";
  String password = "";
  String? emailErrorText;
  String? passwordErrorText;

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

    final AuthService authService = AuthService();

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
                            "assets/image/logo/newlogo.png",
                            width: 252,
                            height: 58,
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          labelText: "이메일",
                          errorText: emailErrorText,
                          onChanged: (String value) {
                            setState(() {
                              email = value;
                            });
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
                          errorText: passwordErrorText,
                          isToggle: true,
                          onToggleObscureText: () {},
                          onChanged: (String value) {
                            setState(() {
                              password = value;
                            });
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
                          onPressed: email != "" && password != ""
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    final response = await authService
                                        .loginService
                                        .login(email, password);

                                    if (response == null) {
                                      setState(() {
                                        emailErrorText = "아이디 혹은 비밀번호가 다릅니다.";
                                        passwordErrorText =
                                            "아이디 혹은 비밀번호가 다릅니다.";
                                      });
                                    } else {
                                      final refreshToken =
                                          response.refreshToken;
                                      final accessToken = response.accessToken;

                                      await storage.write(
                                          key: ACCESS_TOKEN,
                                          value: accessToken);
                                      await storage.write(
                                          key: REFRESH_TOKEN,
                                          value: refreshToken);

                                      final user =
                                          await UserInfoService().findUser();

                                      if (user is! UserInfoModel) return;
                                      ref.read(userProvider.notifier).state =
                                          UserDetailModel().copyWith(
                                              userId: user.id,
                                              isVerified: user.isVerified);

                                      ref
                                          .read(lemonStateNotifierProvider
                                              .notifier)
                                          .lemonInit(userId: user.id!);

                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (_) => const MainScreen(),
                                        ),
                                      );
                                    }
                                  }
                                }
                              : null,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 19),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => const SignUpScreen()));
                            },
                            child: Text(
                              "회원가입",
                              style: FontSizes.getCapsuleStyle().copyWith(
                                color: theme.appColors.hintText,
                              ),
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
