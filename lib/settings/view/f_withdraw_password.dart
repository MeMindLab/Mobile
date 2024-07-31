import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/view/splash_screen.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/services/withdraw_service.dart';

class WithdrawPasswordFragment extends StatefulWidget {
  final String reason;
  const WithdrawPasswordFragment({super.key, required this.reason});

  @override
  State<WithdrawPasswordFragment> createState() =>
      _WithdrawPasswordFragmentState();
}

class _WithdrawPasswordFragmentState extends State<WithdrawPasswordFragment> {
  String password = "";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SeetingCustomTextFormField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          hintText: "비밀번호를 입력해주세요",
          bgColor: AppColors.blue1,
          suffixWidget: const Icon(
            Icons.visibility_off,
            color: AppColors.gray6,
          ),
        ),
        const Spacer(),
        password.length > 0
            ? RoundedButton(
                text: "다음",
                onPressed: () async {
                  var result = await WithDrawService()
                      .withDraw(password: password, reason: widget.reason);
                  if (result is! bool) return;
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
