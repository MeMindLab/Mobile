import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/f_userinfo_form.dart';

class SettingUserInfo extends StatefulWidget {
  final String? userEmail;
  final String? userNickname;
  final String? phoneNumber;
  final bool isVerified;
  final String? referralCode;

  const SettingUserInfo(
      {super.key,
      this.userEmail,
      this.userNickname,
      this.phoneNumber,
      required this.isVerified,
      this.referralCode});

  @override
  State<SettingUserInfo> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingUserInfo> {
  bool isUpdate = false;

  void onUpdate(bool isTrue) {
    setState(() {
      isUpdate = isTrue;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
        title: "계정정보",
        appBarLeading: isUpdate == false ? const BackArrowLeading() : null,
        backgroundColor: theme.appColors.seedColor,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: UserInfoForm(
                    isVerified: widget.isVerified,
                    isUpdate: isUpdate,
                    onUpdate: onUpdate,
                    userEmail: widget.userEmail!,
                    userNickname: widget.userNickname!,
                    userPhoneNumber: widget.phoneNumber,
                    referralCode: widget.referralCode,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
