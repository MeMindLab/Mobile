import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';

class WithdrawPasswordFragment extends StatefulWidget {
  const WithdrawPasswordFragment({super.key});

  @override
  State<WithdrawPasswordFragment> createState() =>
      _WithdrawPasswordFragmentState();
}

class _WithdrawPasswordFragmentState extends State<WithdrawPasswordFragment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SeetingCustomTextFormField(
          onChanged: (value) {},
          hintText: "비밀번호를 입력해주세요",
          bgColor: AppColors.blue1,
          suffixWidget: Icon(
            Icons.visibility_off,
            color: AppColors.gray6,
          ),
        ),
        const Spacer(),
        RoundedButton(
          text: "다음",
          onPressed: () {},
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}
