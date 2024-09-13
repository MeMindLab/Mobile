import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class BottomSnackbar extends StatelessWidget {
  final String text;
  const BottomSnackbar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      height: 48,
      decoration: BoxDecoration(
          color: AppColors.gray5.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10)),
      child: snackBarContent(text),
    );
  }

  Widget snackBarContent(text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: FontSizes.getCapsuleStyle().copyWith(
                fontWeight: FontWeight.w500, color: AppColors.whiteColor)),
      ],
    );
  }
}
