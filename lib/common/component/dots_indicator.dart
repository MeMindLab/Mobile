import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class CustomDotsIndicator extends StatefulWidget {
  const CustomDotsIndicator({super.key});

  @override
  State<CustomDotsIndicator> createState() => _CustomDotsIndicatorState();
}

class _CustomDotsIndicatorState extends State<CustomDotsIndicator> {
  int value = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        value = (value + 1) % 3;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 37,
      height: 20,
      padding: const EdgeInsets.only(left: 7),
      child: Align(
        alignment: Alignment.centerLeft,
        child: DotsIndicator(
          dotsCount: 3,
          position: value.toDouble(),
          decorator: const DotsDecorator(
            color: Colors.grey,
            activeColor: Colors.blue,
            spacing: EdgeInsets.all(3),
          ),
        ),
      ),
    );
  }
}
