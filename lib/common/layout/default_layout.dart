import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/topbar/default_appbar.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;
  final Color? appBarBgColor;

  const DefaultLayout({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.foregroundColor,
    this.appBarActions,
    this.appBarLeading,
    this.appBarBgColor,
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
      extendBody: true,
    );
  }

  DefaultAppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return DefaultAppBar(
        title: title!,
        leading: appBarLeading,
        actions: appBarActions,
        backgroundColor: appBarBgColor,
        foregroundColor: foregroundColor,
      );
    }
  }
}
