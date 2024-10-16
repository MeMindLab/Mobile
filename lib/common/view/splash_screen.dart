import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/token_refresh_service.dart';
import 'package:me_mind/common/view/on_boarding.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';
import 'package:me_mind/user/model/user_signin_model.dart';
import 'package:me_mind/user/view/s_signin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    appLoading();
  }

  void deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("isTutorial");
  }

  void appLoading() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    const FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final bool? isTutorial = prefs.getBool("isTutorial");
    String? refreshToken;

    try {
      refreshToken = await secureStorage.read(key: REFRESH_TOKEN);
    } catch (e) {}

    refreshToken ??= "";

    if (isTutorial == false || isTutorial == null) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => OnBoardingScreen()));
      return;
    } else {
      final dio = Dio();
      // final String? themeMode = prefs.getString('themeMode');
      // if (themeMode == null) {
      //   await prefs.setString('themeMode', 'general mode');
      // }
      try {
        final resp = await dio.get("$ip/auth/token/refresh",
            options: Options(
              headers: {
                'authorization': 'Bearer $refreshToken',
              },
            ));

        await storage.write(
            key: ACCESS_TOKEN, value: resp.data["refresh_token"]);
        // ref.read(userStateNotifierProvider.notifier).userInit();
        // final user = await UserInfoService().findUser();
        await ref.read(userStateNotifierProvider.notifier).userInit();
        await ref.read(lemonStateNotifierProvider.notifier).lemonInit();
        // ref.read(lemonStateNotifierProvider.notifier).lemonInit();
        // print("안농하세요 ${user}");

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
        return;
      } catch (e) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SignInScreen()));
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "마음속 나의 친구 미마인드!",
          style:
              FontSizes.getContentStyle().copyWith(fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 10,
        ),
        Image.asset(
          'assets/image/logo/newlogo.png',
          width: 278,
          height: 64,
        ),
      ],
    )));
  }
}
