import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class SignUpWelcome extends StatefulWidget {
  const SignUpWelcome({super.key});

  @override
  State<SignUpWelcome> createState() => _SignUpWelcomeState();
}

class _SignUpWelcomeState extends State<SignUpWelcome>
    with TickerProviderStateMixin {
  late final AnimationController _lottieController;

  @override
  void initState() {
    //컨트롤러 생성
    _lottieController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    super.initState();
  }

  @override
  void dispose() {
    //컨트롤러 해제
    _lottieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: 280,
                height: 280,
                child: Lottie.asset(
                  "assets/json/welcome.json",
                  repeat: false,
                  onLoaded: (composition) {
                    _lottieController.duration = composition.duration;
                    _lottieController.forward();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 90.0),
                child: Text(
                  "가입이 완료 되었습니다!\n로그인하러 가볼까요?",
                  textAlign: TextAlign.center,
                  style: FontSizes.getHeadline1Style().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 34),
                child: RoundedButton(
                  text: "로그인하기",
                  textStyle: FontSizes.getContentStyle().copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
