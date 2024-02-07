import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double? elevation;
  final double padding;

  final List<Widget>? actions;
  final Widget? leading;

  const DefaultAppBar({
    super.key,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
    this.leading,
    this.elevation = 0,
    this.padding = 20,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leadingWidth: 0,
      title: Text(
        title,
        style: FontSizes.getHeadline1Style().copyWith(
          fontWeight: FontWeight.w500,
          color: foregroundColor,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            children: actions ?? [],
          ),
        ),
      ],
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor ?? Colors.black,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: leading,
      ),
      elevation: elevation ?? 0,
      surfaceTintColor: Colors.transparent,
    );
  }
}
