import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/view/on_boarding.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/user/view/s_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //deleteToken();
    userMe();
    checkToken();
  }

  void deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("isTutorial");
  }

  void checkToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isTutorial = prefs.getBool("isTutorial");

    if (isTutorial == false || isTutorial == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => OnBoardingScreen()));
    } else {
      // 튜토리얼 한 경우
      final accessToken = await storage.read(key: ACCESS_TOKEN);
      final refreshToken = await storage.read(key: REFRESH_TOKEN);

      if (accessToken == null || refreshToken == null) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => SignInScreen()));
      } else {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MainScreen()));
      }
    }
  }

  void userMe() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.remove('is_auth');
    await prefs.remove('email');
    await prefs.remove('nickname');

    await prefs.setBool('is_auth', false);
    await prefs.setString('email', 'test@test.test');
    await prefs.setString('nickname', 'nickname');
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Center(
      child: Image.asset(
        'assets/image/splash/splash.png',
        width: 140,
        height: 140,
      ),
    ));
  }
}
