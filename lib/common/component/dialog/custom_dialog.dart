import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

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
      this.titlePadding});

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

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return AlertDialog(
      alignment: widget.alignment,
      backgroundColor: widget.backgroundColor,
      elevation: widget.elevation,
      shadowColor: widget.shadowColor,
      shape: widget.shape,
      surfaceTintColor: widget.surfaceTintColor ?? theme.appColors.badgeBorder,
      actions: widget.actions,
      actionsPadding: widget.actionsPadding,
      content: widget.content,
      contentPadding: widget.contentPadding,
      insetPadding: widget.insetPadding ?? EdgeInsets.zero,
      title: widget.title,
      titlePadding: widget.titlePadding,
    );
  }
}
