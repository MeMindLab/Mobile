import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';

class SettingUserInfo extends StatefulWidget {
  const SettingUserInfo({super.key});

  @override
  State<SettingUserInfo> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingUserInfo> {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "계정정보",
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromRGBO(241, 243, 248, 1),
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
                              labelText: "닉네임",
                              onChanged: (String value) {},
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SeetingCustomTextFormField(
                              labelText: "비밀번호",
                              onChanged: (String value) {},
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SeetingCustomTextFormField(
                              labelText: "이메일",
                              onChanged: (String value) {},
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            SeetingCustomTextFormField(
                              labelText: "연락처",
                              hintText: "번호를 입력해주세요",
                              onChanged: (String value) {},
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RoundedButton(
                        text: "가입하기",
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
    // return DefaultLayout(
    //   backgroundColor: Colors.white,
    //   title: "계정정보",
    //   appBarActions: [
    //     Container(
    //       margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
    //       child: const Row(
    //         children: [
    //           Text('10',
    //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
    //         ],
    //       ),
    //     ),
    //   ],
    //   appBarLeading: IconButton(
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //     icon: const Icon(Icons.arrow_back),
    //   ),
    //   child: Container(
    //       padding: const EdgeInsets.all(20),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Container(
    //             decoration: const BoxDecoration(
    //                 color: Color.fromRGBO(241, 243, 248, 1)),
    //             width: double.infinity,
    //             height: 500,
    //           ),
    //           const SizedBox(
    //             height: 30,
    //           ),
    //           Container(
    //             width: double.infinity,
    //             height: 55,
    //             child: ElevatedButton(
    //               onPressed: () {},
    //               child: Text(
    //                 "수정",
    //                 style: TextStyle(color: Colors.black, fontSize: 16),
    //               ),
    //               style: ElevatedButton.styleFrom(
    //                   backgroundColor: const Color.fromRGBO(187, 215, 255, 1),
    //                   shape: RoundedRectangleBorder(
    //                       borderRadius: BorderRadius.circular(13))),
    //             ),
    //           ),
    //         ],
    //       )),
    // );
  }
}
