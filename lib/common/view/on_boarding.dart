import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
        title: "",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: Image.asset(
                    'assets/image/onboarding/bg.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Image.asset(
                  'assets/image/onboarding/page1.png',
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
                Align(
                    alignment: const Alignment(0.295, -0.82),
                    child: Image.asset("assets/image/onboarding/hi.png")),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "나만의 일기 친구",
              style: FontSizes.getHeadline1Style()
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "구르미와 대화를 나누며 차근차근 일기를 완성해보아요!\n심리분석 리포트도 받아볼 수 있어요.",
              textAlign: TextAlign.center,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        decoration: getPageDecoration(theme),
      ),
      // 두 번째 페이지
      PageViewModel(
        // 두번째 페이지
        title: "",
        bodyWidget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.11,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: Stack(children: [
                Align(
                  alignment: const Alignment(0, 0.8),
                  child: Image.asset(
                    'assets/image/onboarding/bg.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                // SvgPicture.asset(
                //   "assets/svg/onboarding/onboarding4.svg",
                //   height: MediaQuery.of(context).size.height * 0.32,
                //   fit: BoxFit.contain,
                // ),
                Image.asset(
                  'assets/image/onboarding/page2.png',
                  height: MediaQuery.of(context).size.height * 0.32,
                ),
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "감정 쓰레기통",
              style: FontSizes.getHeadline1Style()
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              "화나거나 누구에게도 말 못할 이야기가 있나요?\n어떤 일이든 OK 소리만 질러도 OK!",
              textAlign: TextAlign.center,
              style: FontSizes.getCapsuleStyle()
                  .copyWith(fontWeight: FontWeight.w400),
            ),
          ],
        ),
        decoration: getPageDecoration(theme),
      ),
    ];

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: IntroductionScreen(
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
        nextFlex: 0,
        next: Text(
          'NEXT',
          style: FontSizes.getContentStyle().copyWith(
            color: AppColors.gray9,
          ),
        ),
        showSkipButton: true,
        globalBackgroundColor: AppColors.blue1,
        skipOrBackFlex: 0,
        skip: Text(
          'SKIP',
          style: FontSizes.getContentStyle().copyWith(
            color: AppColors.gray9,
          ),
        ),
        dotsDecorator: const DotsDecorator(
          color: AppColors.gray3,
          activeColor: AppColors.blueMain,
        ),
        curve: Curves.bounceOut,
      ),
    );
  }
}

PageDecoration getPageDecoration(ThemeData theme) {
  return PageDecoration(
    titleTextStyle: FontSizes.getHeadline1Style().copyWith(
      fontWeight: FontWeight.w600,
      color: AppColors.gray9,
    ),
    bodyTextStyle: FontSizes.getCapsuleStyle().copyWith(
      fontWeight: FontWeight.w400,
      color: AppColors.gray9,
    ),
    imageFlex: 2,
    pageColor: AppColors.blue1,
  );
}
