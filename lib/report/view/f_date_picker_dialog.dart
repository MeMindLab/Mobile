import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/custom_dialog.dart';

class Dialogs {
  static callDateDialog(
      {required BuildContext context,
      Color? backgroundColor,
      Widget? content,
      EdgeInsetsGeometry? contentPadding}) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return CustomDialog(
            backgroundColor: backgroundColor,
            insetPadding: EdgeInsets.zero,
            contentPadding: contentPadding,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(13))),
            content: content);
      },
    );
  }
}
