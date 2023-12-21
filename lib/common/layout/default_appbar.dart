import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;

  final List<Widget>? actions;
  final Widget? leading;

  const DefaultAppBar({
    super.key,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.elevation = 0,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: FontSizes.getHeadline1Style().copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
      centerTitle: true,
      actions: actions,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? Colors.black,
      leading: leading,
      elevation: elevation ?? 0,
    );
  }
}
