import 'package:flutter/material.dart';
import 'package:me_mind/common/component/custom_text_form.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/view/splash_screen.dart';
import 'package:me_mind/settings/services/withdraw_service.dart';

class WithdrawPasswordFragment extends StatefulWidget {
  final String reason;
  const WithdrawPasswordFragment({super.key, required this.reason});

  @override
  State<WithdrawPasswordFragment> createState() =>
      _WithdrawPasswordFragmentState();
}

class _WithdrawPasswordFragmentState extends State<WithdrawPasswordFragment> {
  bool isShow = true;
  String password = "";
  String errorMsg = "";
  bool isError = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        CustomTextFormField(
          isLogin: true,
          hintText: "비밀번호를 입력해주세요",
          maxLength: 15,
          errorText: isError == true ? errorMsg : null,
          obscureText: isShow,
          onChanged: (String value) {
            setState(() {
              password = value;
            });
          },
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SizedBox(
              width: 24,
              height: 24,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      isShow = !isShow;
                    });
                  },
                  icon: isShow == true
                      ? const Icon(
                          Icons.visibility_off,
                          color: AppColors.gray6,
                        )
                      : const Icon(
                          Icons.visibility,
                          color: AppColors.gray6,
                        )),
            ),
          ),
        ),
        const Spacer(),
        password.length > 0
            ? RoundedButton(
                text: "다음",
                onPressed: () async {
                  var result = await WithDrawService()
                      .withDraw(password: password, reason: widget.reason);
                  if (result is! bool) {
                    setState(() {
                      isError = true;
                      errorMsg = "비밀번호가 틀렸습니다.";
                    });
                    return;
                  }

                  await storage.deleteAll();
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SplashScreen()));
                },
              )
            : const RoundedButton(text: "다음"),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
