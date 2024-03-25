import 'package:flutter/material.dart';
import 'package:me_mind/chat/component/custom_snackbar.dart';

class ShowSnackBar {
  showSnackBarFunction(context, String text, {bool? isBack = false}) {
    SnackBar snackBar = SnackBar(
      content: CustomSnackBar(),
      backgroundColor: Colors.transparent,
      elevation: 0,
      dismissDirection: DismissDirection.up,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 230,
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
