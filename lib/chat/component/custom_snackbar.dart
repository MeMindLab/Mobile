import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';

class CustomSnackBar extends StatefulWidget {
  const CustomSnackBar({super.key});

  @override
  State<CustomSnackBar> createState() => _CustomSnackBarState();
}

class _CustomSnackBarState extends State<CustomSnackBar> {
  bool isFirst = true;
  bool isSecond = false;
  double height = 104;
  void firstRemove() {
    Timer(Duration(milliseconds: 1000), () {
      setState(() {
        isSecond = true;
      });
    });
    Timer(Duration(milliseconds: 2700), () {
      setState(() {
        isFirst = false;
        // height = 110;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstRemove();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      height: height,
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        isFirst
            ? Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                    color: lightTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10)),
                child: SnackBarContent("리포트를 생성 중입니다. 창을 닫지말고 기다려주세요."),
              )
            : const SizedBox(),
        isFirst
            ? const SizedBox(
                height: 8,
              )
            : const SizedBox(),
        isSecond
            ? AnimatedOpacity(
                opacity: isSecond ? 1 : 0,
                duration: const Duration(milliseconds: 500),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      color: lightTheme.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  child: SnackBarContent("비타민을 1개 소모했어요."),
                ),
              )
            : const SizedBox(),
      ]),
    );
  }

  Widget SnackBarContent(text) {
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
      ],
    );
  }
}
