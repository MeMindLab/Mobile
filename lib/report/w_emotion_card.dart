import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/report/type/emotion.dart';

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 30); // 시작점 설정
    path.quadraticBezierTo(size.width / 2, size.height, size.width,
        size.height - 30); // 반달을 만드는 Bezier 곡선
    path.lineTo(size.width, 0); // 오른쪽 상단으로 선 긋기
    path.close(); // 경로를 닫아줍니다.
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
    return Container(
      width: 83,
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: const Color(0xFFFFF8BE),
      ),
      child: Stack(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: 83,
              height: 68,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).primaryColor,
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(21, 0, 21, 13),
                child: Image.asset(
                  emotionType.iconAssetPath,
                  width: 41,
                  height: 41,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 21,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  emotionType.displayName,
                  style: FontSizes.getCapsuleHighlightStyle(),
                ),
                Text(
                  '${emotionPercentage.toStringAsFixed(1)}%',
                  style: FontSizes.getSmallStyle(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
