import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/token_refresh_service.dart';
import 'package:me_mind/common/view/on_boarding.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';
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
    userMe();
    appLoading();
  }

  void deleteToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("isTutorial");
  }

  void appLoading() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isTutorial = prefs.getBool("isTutorial");

    if (isTutorial == false || isTutorial == null) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (_) => OnBoardingScreen()));
    } else {
      try {
        final tokenResponse = await TokenRefreshService().refresh();

        await storage.write(
            key: ACCESS_TOKEN, value: tokenResponse.accessToken);

        final userInfo = await UserInfoService().findUser();

        if (userInfo.nickname != null || userInfo.email != null) {
          await prefs.setString("USER_NICKNAME", userInfo.nickname);
          await prefs.setString("USER_EMAIL", userInfo.email);
        }
        ref.watch(userProvider.notifier).state = UserDetailModel()
            .copyWith(userId: userInfo.id, isVerified: userInfo.isVerified);
        ref
            .read(lemonStateNotifierProvider.notifier)
            .lemonInit(userId: userInfo.id);

        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => MainScreen()));
      } catch (e) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (_) => SignInScreen()));
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
