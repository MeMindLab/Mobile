import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class LemonNumberWidget extends StatelessWidget {
  final String numberText;

  const LemonNumberWidget({
    super.key,
    required this.numberText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          'assets/svg/icon/lemon.svg',
          width: 28,
          height: 28,
        ),
        const SizedBox(width: 3.0),
        Text(
          numberText,
          style: FontSizes.getHeadline1Style().copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          width: 5,
        )
      ],
    );
  }
}
