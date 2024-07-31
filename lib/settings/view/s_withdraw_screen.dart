import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/settings/view/f_withdraw_check.dart';
import 'package:me_mind/settings/view/f_withdraw_notice.dart';
import 'package:me_mind/settings/view/f_withdraw_password.dart';

class WithDrawScreen extends StatefulWidget {
  const WithDrawScreen({super.key});

  @override
  State<WithDrawScreen> createState() => _WithDrawScreenState();
}

class _WithDrawScreenState extends State<WithDrawScreen> {
  ScreenState screen = ScreenState.check;
  String reason = "";

  void updateReason(String? text) {
    setState(() {
      reason = text!;
    });
  }

  void changeScreen(ScreenState? state) {
    setState(() {
      screen = state!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "계정 탈퇴",
        appBarLeading: const BackArrowLeading(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: screen == ScreenState.check
                ? WidthdrawCheckFragment(
                    reasonUpdate: updateReason,
                    screenUpdate: changeScreen,
                  )
                : screen == ScreenState.notice
                    ? WithdrawNoticeFragment()
                    : WithdrawPasswordFragment(),
          ),
        ));
  }
}

enum ScreenState {
  check,
  notice,
  password,
}
