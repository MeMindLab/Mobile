import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
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
      pages: pages,
      done: Text(
        "NEXT",
        style: FontSizes.getContentStyle().copyWith(
          color: AppColors.gray9,
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
      next: Text(
        'NEXT',
        style: FontSizes.getContentStyle().copyWith(
          color: AppColors.gray9,
        ),
      ),
      showSkipButton: true,
      skip: Text(
        'SKIP',
        style: FontSizes.getContentStyle().copyWith(
          color: AppColors.gray9,
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
  return PageDecoration(
    titleTextStyle: FontSizes.getHeadline1Style().copyWith(
      fontWeight: FontWeight.w500,
      color: AppColors.gray9,
    ),
    bodyTextStyle: FontSizes.getContentStyle().copyWith(
      color: AppColors.gray9,
    ),
    imageFlex: 2,
    pageColor: theme.scaffoldBackgroundColor,
  );
}
