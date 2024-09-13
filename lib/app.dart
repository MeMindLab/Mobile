import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:me_mind/chat/view/s_chat.dart';
import 'package:me_mind/chat/view/s_trash.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/view/splash_screen.dart';
import 'package:me_mind/settings/view/s_setting.dart';
import 'package:me_mind/settings/view/s_setting_userinfo.dart';
import 'package:me_mind/settings/view/s_withdraw_screen.dart';
import 'package:me_mind/user/view/s_signin.dart';
import 'package:me_mind/user/view/s_signup_welcome.dart';
import 'package:me_mind/user/view/signup_screen.dart';
import 'package:me_mind/diary/view/s_diary.dart';
import 'package:me_mind/report/view/f_search.dart';
import 'package:me_mind/report/view/s_report.dart';
import 'package:me_mind/report/view/s_report_detail.dart';
import 'package:me_mind/report/view/s_report_month.dart';
import 'package:me_mind/report/view/s_report_search.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'common/theme/custom_theme_app.dart';
import 'common/theme/custom_theme_holder.dart';

class App extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  static bool isForeground = true;

  static CustomTheme? defaultTheme = CustomTheme.light;

  const App({super.key});

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> with WidgetsBindingObserver {
  GlobalKey<NavigatorState> get navigatorKey => App.navigatorKey;

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
    return CustomThemeApp(
      child: Builder(builder: (context) {
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
            overlays: [SystemUiOverlay.bottom]);
        return MaterialApp(
          navigatorKey: App.navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          title: 'Me mind',
          theme: CustomThemeHolder.of(context).theme.themeData,
          home: const SplashScreen(),
        );
      }),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        App.isForeground = true;
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        App.isForeground = false;
        break;
      case AppLifecycleState.detached:
        break;
      case AppLifecycleState.hidden:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }
}
