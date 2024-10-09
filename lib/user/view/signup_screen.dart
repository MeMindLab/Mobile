import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/dialog/d_bottom_sheet.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/user/component/agree_checkSet_component.dart';
import 'package:me_mind/user/component/custom_checkbox.dart';
import 'package:me_mind/user/provider/agree_provider.dart';
import 'package:me_mind/user/view/s_signup_welcome.dart';
import 'package:me_mind/user/viewmodel/signup_viewmodel.dart';
import 'package:me_mind/utils/validate.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  final bool isOnBoarding;

  const SignUpScreen({super.key, required this.isOnBoarding});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  String email = "";
  String name = "";
  String pwd = "";
  String brandName = "memind";
  final SignUpViewModel signUpViewModel = SignUpViewModel();

  bool emailCheck = false;
  bool nicknameCheck = false;
  bool pwdShow = true;
  String? errorEmailText;
  String? errorNameText;
  String? errorReferralText;
  TextEditingController referralController = TextEditingController(text: "");
  bool isStop = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final agree = ref.watch(agreeStateNotifierProvider);

    return DefaultLayout(
      title: "회원가입",
      appBarLeading: widget.isOnBoarding
          ? null
          : BackArrowLeading(
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
      backgroundColor: Colors.white,
      isResizeToAvoid: true,
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
                        hintText: "example@gmail.com",
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
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.blue6, BlendMode.srcIn),
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
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.blue6, BlendMode.srcIn),
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
                      const SizedBox(
                        height: 15,
                      ),
                      CustomTextFormField(
                        isLogin: false,
                        labelText: "추천인 (선택)",
                        controller: referralController,
                        errorText: errorReferralText,
                        hintText: "추천인 코드를 입력해주세요",
                        bgColor: AppColors.gray1,
                        onChanged: (String value) {},
                      ),
                      const Spacer(),
                      Stack(children: [
                        CustomCheckBox(
                          title: "전체 동의",
                          isBold: true,
                          svg: "check_all.svg",
                          isChecked: agree.isAll,
                          onChanged: () {
                            ref
                                .read(agreeStateNotifierProvider.notifier)
                                .updateAll(isTrue: !agree.isAll);
                          },
                        ),
                        Positioned(
                          right: 5,
                          child: InkWell(
                            child:
                                Image.asset("assets/image/icon/arrow_down.png"),
                            onTap: () {
                              BottomSheets(
                                      context: context,
                                      height: 368,
                                      isAgree: true,
                                      isBarrier: true,
                                      bodies: const AgreeCheckSetComponent())
                                  .show();
                            },
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 28,
                      ),
                      PopScope(
                        onPopInvoked: (isTrue) {
                          setState(() {
                            isStop = isTrue;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 32),
                          child: agree.isSubmitted
                              ? RoundedButton(
                                  text: "가입하기",
                                  onPressed: () async {
                                    if (formKey.currentState!.validate()) {
                                      final signUpResult =
                                          await signUpViewModel.signUpUser(
                                        email,
                                        name,
                                        pwd,
                                        referralController.text,
                                        context: context,
                                        isAdvertise: agree.isAdvertising,
                                        isAppPush: agree.isAppPush,
                                      );

                                      if (signUpResult["success"]) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    SignUpWelcome()));
                                      } else {
                                        setState(() {
                                          errorEmailText =
                                              signUpResult["email"];
                                          errorNameText = signUpResult["name"];
                                          errorReferralText =
                                              signUpResult["referral"];
                                        });
                                        return;
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
