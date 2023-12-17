import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';

class SettingUserInfo extends StatefulWidget {
  const SettingUserInfo({super.key});

  @override
  State<SettingUserInfo> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingUserInfo> {
  final _formKey = GlobalKey<FormState>();
  // form onSaved need
  // form validate need?
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "계정정보",
        backgroundColor: AppColors.whiteColor,
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: AppColors.blue1,
                              borderRadius: BorderRadius.circular(13.0)),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 49.5),
                                child: SvgPicture.asset(
                                  '${baseImageSvgPath}/icon/logo.svg',
                                ),
                              ),
                              const SizedBox(
                                height: 54,
                              ),
                              SeetingCustomTextFormField(
                                initialText: "구르미조아",
                                bgColor: Colors.white,
                                labelText: "닉네임",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                bgColor: Colors.white,
                                labelText: "비밀번호",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                bgColor: Colors.white,
                                labelText: "이메일",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 12.0,
                              ),
                              SeetingCustomTextFormField(
                                bgColor: Colors.white,
                                labelText: "연락처",
                                hintText: "번호를 입력해주세요",
                                onChanged: (String value) {},
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        RoundedButton(
                          text: "수정",
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "계정 탈퇴하기",
                          style: TextStyle(color: AppColors.blue7),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
