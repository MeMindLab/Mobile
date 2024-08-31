import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class CustomSnackBar extends StatefulWidget {
  final String text;
  const CustomSnackBar({super.key, required this.text});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  bool isFirst = true;
  bool isSecond = false;
  double height = 104;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
          color: lightTheme.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: snackBarContent(widget.text),
    );
  }

  Widget snackBarContent(text) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        SvgPicture.asset(
          'assets/svg/chat/snack_icon.svg',
          width: 22,
          height: 22,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(text,
            style: FontSizes.getCapsuleStyle()
                .copyWith(fontWeight: FontWeight.w500)),
        const Spacer(),
      ],
    );
  }
}
