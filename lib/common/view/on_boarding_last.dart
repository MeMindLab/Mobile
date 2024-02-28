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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.11,
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.33,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment(0, 0.3),
                          child: Image.asset(
                            'assets/image/onboarding/bg.png',
                            height: MediaQuery.of(context).size.height * 0.32,
                          ),
                        ),
                        Image.asset(
                          'assets/image/onboarding/page3.png',
                          height: MediaQuery.of(context).size.height * 0.32,
                        ),
                      ],
                    ),
                  )),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "심리분석 리포트",
                      style: FontSizes.getHeadline1Style().copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Text(
                        "일기를 내용을 바탕으로\n내가 미처 알지 못했던 감정상태를 분석해주고,\nAI 그림도 만들 수 있어요!",
                        textAlign: TextAlign.center,
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
