import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class CertifyTimer extends StatelessWidget {
  final int timerCount;
  const CertifyTimer({super.key, required this.timerCount});

  @override
  Widget build(BuildContext context) {
    return Text(
      "0${timerCount ~/ 60}".padLeft(2, "0") +
          ":" +
          "${timerCount % 60}".padLeft(2, "0") +
          "   ",
      style: FontSizes.getContentStyle().copyWith(color: Colors.red),
    );
  }
}
