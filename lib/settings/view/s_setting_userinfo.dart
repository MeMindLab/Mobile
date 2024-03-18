import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/f_userinfo_form.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingUserInfo extends StatefulWidget {
  final VoidCallback handlePhoneAuth;
  const SettingUserInfo({super.key, required this.handlePhoneAuth});

  @override
  State<SettingUserInfo> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingUserInfo> {
  bool isUpdate = false;
  String email = "";
  String nickname = "";
  void onUpdate(bool isTrue) {
    setState(() {
      isUpdate = isTrue;
    });
  }

  void getIsAuth() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    String? isEmail = await prefs.getString('email');
    String? isNickname = await prefs.getString('nickname');
    print(isEmail);
    if (isEmail != null) {
      setState(() {
        email = isEmail;
      });
    }
    if (isNickname != null) {
      setState(() {
        nickname = isNickname;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getIsAuth();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
        title: "계정정보",
        appBarLeading: isUpdate == false ? const BackArrowLeading() : null,
        backgroundColor: theme.appColors.seedColor,
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: UserInfoForm(
                    isUpdate: isUpdate,
                    onUpdate: onUpdate,
                    handlePhoneAuth: widget.handlePhoneAuth,
                    userEmail: email,
                    userNickname: nickname,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
