import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DiaryFloatingButton extends StatelessWidget {
  final VoidCallback scrollToTop;

  const DiaryFloatingButton({super.key, required this.scrollToTop});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 38,
      height: 38,
      child: FloatingActionButton(
        onPressed: () {
          scrollToTop();
        },
        backgroundColor: Colors.white,
        elevation: 12,
        child: SvgPicture.asset('assets/svg/chat/arrow_up.svg'),
        shape: const CircleBorder(),
      ),
    );
  }
}
