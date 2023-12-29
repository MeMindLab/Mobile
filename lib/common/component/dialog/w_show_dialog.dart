import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/d_aligncenter_dialog.dart';
import 'package:me_mind/common/component/dialog/d_alignstart_dialog.dart';

class ShowDialog {
  // 일반 다이얼로그 사진, 타이틀, 내용, 중앙 정렬 시 사용
  void showAlignCenterDialog(
    BuildContext context, {
    required String buttonText,
    String? imageLink,
    required String contentTitleText,
    String? contentDetailText,
    String? cancelButtonText,
    required VoidCallback handleSubmit,
    VoidCallback? handleCancelSubmit,
    ButtonDirection? buttonDirection,
    bool? isButtonWidthHalf,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlignCenterDialog(
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            imageLink: imageLink,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
            buttonDirection: buttonDirection ?? ButtonDirection.horizontal,
            isButtonWidthHalf: isButtonWidthHalf ?? false,
          );
        });
  }

  // 텍스트 왼쪽 정렬, 알림 수신 동의 등 사용
  void showAlignStartDialog(
    BuildContext context, {
    required String buttonText,
    required String contentTitleText,
    String? contentDetailText,
    String? cancelButtonText,
    required VoidCallback handleSubmit,
    VoidCallback? handleCancelSubmit,
  }) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlignStartDialog(
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
          );
        });
  }
}
