import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/screen/main/s_main.dart';

class MyApp extends StatefulWidget {
  // static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static bool isForeground = true;

  static CustomTheme? defaultTheme;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> with WidgetsBindingObserver {
  // GlobalKey<NavigatorState> get navigatorKey => MyApp.navigatorKey;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // navigatorKey: MyApp.navigatorKey,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Memind',
      home: MainScreen(),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        MyApp.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        MyApp.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        // TODO: Handle this case.
    }
    super.didChangeAppLifecycleState(state);
  }
}
