import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/d_common_dialog.dart';
import 'package:me_mind/common/component/dialog/d_confirm_dialog.dart';

class getDialog {
  // 일반 다이얼로그 사진, 타이틀, 내용, 중앙 정렬 시 사용
  void getCustomDialog(
    BuildContext context, {
    required String buttonText,
    String? imageLink,
    required String contentTitleText,
    String? contentDetailText,
    String? cancelButtonText,
    required VoidCallback onSubmit,
    VoidCallback? onCancelSubmit,
    ButtonDirection? buttonDirection,
    bool? isButtonWidthHalf,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialog(
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            imageLink: imageLink,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            onSubmit: onSubmit,
            onCancelSubmit: onCancelSubmit,
            buttonDirection: buttonDirection ?? ButtonDirection.horizontal,
            isButtonWidthHalf: isButtonWidthHalf ?? false,
          );
        });
  }

  // 텍스트 왼쪽 정렬, 알림 수신 동의 등 사용
  void getConfirmDialog(
    BuildContext context, {
    required String buttonText,
    required String contentTitleText,
    String? contentDetailText,
    String? cancelButtonText,
    required VoidCallback onSubmit,
    VoidCallback? onCancelSubmit,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ConfirmDialog(
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            onSubmit: onSubmit,
            onCancelSubmit: onCancelSubmit,
          );
        });
  }
}
