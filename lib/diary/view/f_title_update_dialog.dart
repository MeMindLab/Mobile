import 'package:flutter/material.dart';

import 'package:me_mind/common/component/dialog/custom_dialog.dart';

class DiaryDialogs {
  final BuildContext context;
  Color? backgroundColor;
  Widget? content;
  EdgeInsetsGeometry? contentPadding;

  DiaryDialogs({
    required this.context,
    this.backgroundColor,
    this.content,
    this.contentPadding,
  });

  Future callTitleUpdateDialog() {
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
