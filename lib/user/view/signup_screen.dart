import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: Center(
        child: Text("회원가입 페이지"),
      ),
    );
  }
}
