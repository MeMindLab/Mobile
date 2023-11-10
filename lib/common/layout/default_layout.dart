import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final List<Widget>? appBarActions;
  final Widget? appBarLeading;

  const DefaultLayout({
    super.key,
    required this.child,
    this.title,
    this.bottomNavigationBar,
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
      bottomNavigationBar: bottomNavigationBar,
    );
  }

  AppBar? renderAppBar() {
    if (title == null) {
      return null;
    } else {
      return AppBar(
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
        foregroundColor: Colors.white,
        actions: appBarActions,
      );
    }
  }
}
