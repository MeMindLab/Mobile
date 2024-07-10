import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/model/user_info_model.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';
import 'package:me_mind/settings/view/f_userinfo_form.dart';

class SettingUserInfo extends StatefulWidget {
  final String? userEmail;
  final String? userNickname;

  const SettingUserInfo({super.key, this.userEmail, this.userNickname});

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
                    child: FutureBuilder(
                      future: UserInfoService().findUser(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.hasData) {
                          var userInfo = snapshot.data as UserInfoModel;
                          return UserInfoForm(
                            isUpdate: isUpdate,
                            onUpdate: onUpdate,
                            userEmail: userInfo.email!,
                            userNickname: userInfo.nickname!,
                          );
                        } else {
                          return const Center(child: Text('계정정보 불러오기 실패'));
                        }
                      },
                    )),
              ),
            )
          ],
        ));
  }
}
