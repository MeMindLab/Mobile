import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  // build Dots

  AnimatedContainer _buildDots({int? index}) {
    return AnimatedContainer(
      duration: const Duration(microseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        color: const Color(0xFFA9D0FF),
      ),
      margin: const EdgeInsets.only(right: 5),
      height: 10,
      curve: Curves.easeIn,
      width: _currentPage == index ? 20 : 10,
    );
  }

  final _controller = PageController();
  bool loader = false;
  int _currentPage = 0;

  final List<String> images = <String>['page1.png', 'page2.png', 'page3.png'];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return DefaultLayout(
        child: SafeArea(
      top: true,
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                itemCount: images.length,
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: (height >= 840) ? 40 : 40,
                        ),
                        Image.asset(
                          'assets/image/onboarding/${images[index]}',
                          height: MediaQuery.of(context).size.height * 0.32,
                        ),
                        SizedBox(
                          height: (height >= 840) ? 20 : 20,
                        ),
                        Text(
                          "무료체험기간이 시작되었어요!",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      images.length,
                      (int index) => _buildDots(index: index),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFA9D0FF),
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.all(10.0),
                ),
                child: const Text(
                  "다음",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
