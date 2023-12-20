import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:me_mind/common/view/on_boarding_last.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<PageViewModel> pages = [
      // 첫 번째 페이지
      PageViewModel(
        title: "무료체험기간이 시작되었어요!",
        body: "처음 7일간은 미마인드에서 제공하는\n 모든 기능을 사용하실 수 있어요.",
        image: Image.asset(
          'assets/image/onboarding/page1.png',
          height: MediaQuery.of(context).size.height * 0.32,
        ),
        decoration: getPageDecoration(theme),
      ),
      // 두 번째 페이지
      PageViewModel(
        // 두번째 페이지
        title: "무료체험기간이 시작되었어요!",
        body: "처음 7일간은 미마인드에서 제공하는\n 모든 기능을 사용하실 수 있어요.",
        image: Image.asset(
          'assets/image/onboarding/page2.png',
          height: MediaQuery.of(context).size.height * 0.32,
        ),
        decoration: getPageDecoration(theme),
      ),
    ];

    return IntroductionScreen(
      // theme변수 이용해서 변경 필요!
      globalBackgroundColor: const Color(0xFF161B22),

      pages: pages,
      done: const Text(
        "NEXT",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      onDone: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingLastScreen(),
          ),
        );
      },
      onSkip: () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => const OnBoardingLastScreen(),
          ),
        );
      },
      next: const Text(
        "NEXT",
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      showSkipButton: true,
      skip: const Text(
        'SKIP',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.white,
        ),
      ),
      dotsDecorator: const DotsDecorator(
        color: Color(0xFFCCCCCC),
        activeColor: Color(0xFFA9D0FF),
      ),
      curve: Curves.bounceOut,
    );
  }
}

PageDecoration getPageDecoration(ThemeData theme) {
  return const PageDecoration(
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    bodyTextStyle: TextStyle(fontSize: 18, color: Colors.white),
    // pageColor: theme의 asb theme color에 추가 된고 app colors에 있는 다크테마의 메인 배경색 사용
    imageFlex: 2,
    pageColor: Color(0xFF161B22),
  );
}
