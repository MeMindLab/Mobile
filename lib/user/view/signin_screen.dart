import 'package:flutter/material.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "로그인",
        child: Column(
          children: [
            CustomTextFormField(
              labelText: "이메일",
              onChanged: (String value) {},
            ),
            CustomTextFormField(
              labelText: "비밀번호",
              onChanged: (String value) {},
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.black,
                padding: const EdgeInsets.all(10.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(13),
                ),
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text("가입하기"),
            ),
          ],
        ));
  }
}
