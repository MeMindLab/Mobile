import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class SignUpWelcome extends StatefulWidget {
  const SignUpWelcome({super.key});

  @override
  State<SignUpWelcome> createState() => _SignUpWelcomeState();
}

class _SignUpWelcomeState extends State<SignUpWelcome> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Text(
              "가입이 완료 되었습니다!\n로그인하러 가볼까요?",
              style: FontSizes.getHeadline1Style().copyWith(
                fontWeight: FontWeight.w500,
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
    ));
  }
}
