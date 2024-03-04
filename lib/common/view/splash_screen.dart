import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        child: Center(
      child: Image.asset(
        'assets/image/splash/splash.png',
        width: 109,
        height: 109,
      ),
    ));
  }
}
