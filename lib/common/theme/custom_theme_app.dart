import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../app.dart';
import 'custom_theme.dart';
import 'custom_theme_holder.dart';

class CustomThemeApp extends StatefulWidget {
  final Widget child;

  const CustomThemeApp({Key? key, required this.child}) : super(key: key);

  @override
  State<CustomThemeApp> createState() => _CustomThemeAppState();
}

class _CustomThemeAppState extends State<CustomThemeApp> {
  late CustomTheme theme =
      App.defaultTheme ?? systemTheme; //디폴트를 주시거나, 시스템을 따라가게 합니다.

  final CustomTheme? defaultTheme = CustomTheme.dark;

  void handleChangeTheme(CustomTheme theme) {
    setState(() => this.theme = theme);
  }

  @override
  Widget build(BuildContext context) {
    return CustomThemeHolder(
      changeTheme: handleChangeTheme,
      theme: theme,
      child: widget.child,
    );
  }

  CustomTheme get systemTheme {
    switch (SchedulerBinding.instance.platformDispatcher.platformBrightness) {
      case Brightness.dark:
        return CustomTheme.dark;
      case Brightness.light:
        return CustomTheme.light;
    }
  }
}
