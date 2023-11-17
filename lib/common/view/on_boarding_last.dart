import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/user/view/signup_screen.dart';

class OnBoardingLastScreen extends StatelessWidget {
  const OnBoardingLastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

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
              const Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text(
                      "Connect",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "처음 7일간은 미마인드에서 제공하는\n 모든 기능을 사용하실 수 있어요.",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const SignUpScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA9D0FF),
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.all(10.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13),
                  ),
                ),
                child: const Text(
                  "시작하기",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
