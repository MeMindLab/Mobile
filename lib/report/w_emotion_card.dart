import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/report/type/emotion.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0, size.height - 28);

    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - 28,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class EmotionCard extends StatelessWidget {
  final EmotionType emotionType; // 감정 타입
  final double emotionPercentage; // 감정 수치 (e.g., 36.8%)

  const EmotionCard(
      {required this.emotionType, required this.emotionPercentage, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      child: Container(
        width: 83,
        height: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.9),
                spreadRadius: 0.1,
                blurRadius: 0.1,
                offset: const Offset(0, 0),
              ),
            ]),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 74,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            Positioned(
              top: 4,
              child: Image.asset(
                emotionType.iconAssetPath,
                width: 41,
                height: 41,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    emotionType.displayName,
                    style: FontSizes.getCapsuleHighlightStyle().copyWith(
                      height: 1,
                    ),
                  ),
                  Text(
                    '${emotionPercentage.toStringAsFixed(1)}%',
                    style: FontSizes.getXSmallStyle().copyWith(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
