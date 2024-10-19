import 'package:flutter/material.dart';
import 'package:me_mind/chat/component/custom_snackbar.dart';
import 'package:me_mind/common/component/bottom_snackbar.dart';

class ShowSnackBar {
  showSnackBarFunction(context, String msg) {
    SnackBar snackBar = SnackBar(
      content: CustomSnackBar(text: msg),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: const Duration(days: 1),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 160,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showSnackBarDurationFunction(context, String msg) {
    SnackBar snackBar = SnackBar(
      content: CustomSnackBar(text: msg),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 160,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showBottomSnackBar(context, String msg) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    SnackBar snackBar = SnackBar(
      content: BottomSnackbar(text: msg),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      duration: const Duration(milliseconds: 1500),
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 25, left: 30, right: 30),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
