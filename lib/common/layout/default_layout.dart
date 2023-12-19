import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/app_colors.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;

  const DefaultLayout({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.appBarActions,
    this.appBarLeading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      appBar: renderAppBar(),
      bottomSheet: bottomSheet,
      bottomNavigationBar: bottomNavigationBar,
      resizeToAvoidBottomInset: false,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
        backgroundColor: backgroundColor,
        leading: appBarLeading,
        elevation: 0,
        centerTitle: true,
        title: Text(
          title!,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        foregroundColor: Colors.black,
        actions: appBarActions,
      );
    }
  }
}
