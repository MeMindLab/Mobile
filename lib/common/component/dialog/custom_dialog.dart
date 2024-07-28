import 'package:flutter/material.dart';

void showCustomDialog(context, CustomDialog dialog) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      });
}

class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {super.key,
      this.alignment,
      this.backgroundColor,
      this.elevation,
      this.shadowColor,
      this.shape,
      this.surfaceTintColor,
      this.actions,
      this.actionsPadding,
      this.content,
      this.contentPadding,
      this.insetPadding,
      this.title,
      this.titlePadding,
      this.dialogRadius});

  final AlignmentGeometry? alignment;
  final Color? backgroundColor;
  final double? elevation;
  final Color? shadowColor;
  final ShapeBorder? shape;
  final Color? surfaceTintColor;
  final List<Widget>? actions;
  final EdgeInsetsGeometry? actionsPadding;
  final Widget? content;
  final EdgeInsetsGeometry? contentPadding;
  final EdgeInsets? insetPadding;
  final Widget? title;
  final EdgeInsetsGeometry? titlePadding;
  final double? dialogRadius;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    var deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(widget.dialogRadius ?? 13), // 모서리 반경 설정
        ),
        alignment: widget.alignment,
        backgroundColor: widget.backgroundColor ?? Colors.transparent,
        elevation: widget.elevation,
        shadowColor: widget.shadowColor ?? Colors.transparent,
        surfaceTintColor: widget.backgroundColor ?? Colors.transparent,
        actions: widget.actions,
        actionsPadding:
            widget.actionsPadding ?? const EdgeInsets.symmetric(horizontal: 15),
        content: SizedBox(width: deviceWidth * 0.77, child: widget.content),
        contentPadding: widget.contentPadding ?? const EdgeInsets.only(top: 5),
        insetPadding: widget.insetPadding ?? EdgeInsets.zero,
        title: widget.title,
        titlePadding: widget.titlePadding ?? const EdgeInsets.only(top: 30),
      ),
    );
  }
}
