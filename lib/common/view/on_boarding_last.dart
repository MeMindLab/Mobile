import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/user/view/signup_screen.dart';

class OnBoardingLastScreen extends StatelessWidget {
  const OnBoardingLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: Image.asset(
                  'assets/image/onboarding/page1.png',
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "온보딩 내용 3",
                      style: FontSizes.getHeadline1Style().copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        "처음 7일간은 미마인드에서 제공하는\n 모든 기능을 사용하실 수 있어요.",
                        style: FontSizes.getContentStyle(),
                      ),
                    ),
                  ],
                ),
              ),
              RoundedButton(
                text: "시작하기 ",
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
