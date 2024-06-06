import 'package:flutter/material.dart';
import 'package:me_mind/chat/component/custom_snackbar.dart';

class ShowSnackBar {
  showSnackBarFunction(context) {
    SnackBar snackBar = SnackBar(
      content: const CustomSnackBar(text: "리포트를 생성 중입니다.창을 닫지말고 기다려주세요."),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: const Duration(seconds: 1),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 160,
      ),
    );
    SnackBar snackBar2 = SnackBar(
      content: const CustomSnackBar(text: "비타민을 1개 소비했어요."),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 160,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    ScaffoldMessenger.of(context).showSnackBar(snackBar2);
  }
}
