import 'package:flutter/material.dart';
import 'package:me_mind/common/component/dialog/d_alarm_confirm_dialog.dart';
import 'package:me_mind/common/component/dialog/d_button_column_dialog.dart';
import 'package:me_mind/common/component/dialog/d_button_row_dialog.dart';
import 'package:me_mind/common/component/dialog/d_diffbutton_row_dialog.dart';
import 'package:me_mind/common/component/dialog/d_normal_dialog.dart';

class ShowDialog {
  BuildContext context;
  String buttonText;
  String? imageLink;
  String contentTitleText;
  String? contentDetailText;
  String? cancelButtonText;
  VoidCallback handleSubmit;
  VoidCallback? handleCancelSubmit;

  ShowDialog({
    required this.context,
    required this.buttonText,
    this.imageLink,
    required this.contentTitleText,
    this.contentDetailText,
    this.cancelButtonText,
    required this.handleSubmit,
    this.handleCancelSubmit,
  });

  void showNormalDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return NormalDialog(
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
          );
        });
  }

  void showButtonRowDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ButtonRowDialog(
            imageLink: imageLink,
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
          );
        });
  }

  void showDiffButtonRowDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return DiffButtonRowDialog(
            imageLink: imageLink,
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
          );
        });
  }

  void showButtonColumnDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return ButtonColumnDialog(
            imageLink: imageLink,
            contentTitleText: contentTitleText,
            contentDetailText: contentDetailText,
            buttonText: buttonText,
            cancelButtonText: cancelButtonText,
            handleSubmit: handleSubmit,
            handleCancelSubmit: handleCancelSubmit,
          );
        });
  }

  void showAlarmConfirmDialog() {
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
