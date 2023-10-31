import 'package:flutter/material.dart';

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
  final CustomTheme? defaultTheme = App.defaultTheme;
  late CustomTheme? theme = defaultTheme;

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
}
