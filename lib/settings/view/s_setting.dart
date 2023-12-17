// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_dialog.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/report/view/s_report_detail.dart';
import 'package:me_mind/settings/component/certified_box.dart';
import 'package:me_mind/settings/component/settings_dialog.dart';
import 'package:me_mind/settings/component/settings_menu.dart';
import 'package:me_mind/settings/view/s_setting_opinion.dart';
import 'package:me_mind/settings/view/s_setting_userinfo.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
    setBottomIdx(3);
  }

  @override
  Widget build(BuildContext context) {
    final settingmenus = ['FAQ', '이용 약관', '개인정보 처리방침'];
    return DefaultLayout(
      title: "설정",
      backgroundColor: AppColors.blue1,
      appBarActions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/icon/vitamin.svg'),
              const Text('10',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
      appBarLeading: IconButton(
        onPressed: () async {
          await setBottomIdx(1);
          Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: ((BuildContext context,
                        Animation<double> animation1,
                        Animation<double> animation2) =>
                    const ReportDetailScreen()),
                transitionDuration: Duration.zero,
                reverseTransitionDuration: Duration.zero,
              ));
        },
        icon: const Icon(Icons.arrow_back),
      ),

      // 설정 화면 Body
      child: Container(
        // 배경 색
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Stack(children: [
              SettingMenu(
                subscribe: true,
                height: 97,
                content: ListTile(
                  title: const Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "구독플랜",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "무료 멤버십",
                        style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 102,
                    height: 41,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13))),
                    child: TextButton(
                      child: const Center(
                          child: Text(
                        "pro 구독",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: const Color.fromRGBO(255, 238, 151, 1),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(13))),
                      ),
                      onPressed: () {
                        // 구독 버튼
                      },
                    ),
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  width: double.infinity,
                  height: 97,
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(0, 0, 0, 0.8),
                      borderRadius: BorderRadius.circular(13)),
                  child: const Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.ios_share,
                        color: AppColors.whiteColor,
                      ),
                      Text(
                        "1월 중 오픈 예정",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  )),
                ),
              )
            ]),
            SettingMenu(
              subscribe: false,
              height: 66,
              content: ListTile(
                onTap: () {
                  // 계정 정보 페이지로 이동하는 부분
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingUserInfo()));
                },
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "계정정보",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    CertifiedBox(certi: true),
                  ],
                ),
              ),
            ),
            SettingMenu(
              subscribe: false,
              height: 66,
              content: ListTile(
                onTap: () {},
                title: Text(
                  "테마 설정하기",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SettingMenu(
              subscribe: false,
              height: 66,
              content: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingOpinion()));
                },
                title: Text(
                  "의견 보내기",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SettingMenu(
                subscribe: false,
                height: 198,
                content: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (BuildContext contexnt, int idx) {
                      return ListTile(
                        visualDensity: const VisualDensity(vertical: -1),
                        title: Text(
                          settingmenus[idx],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                    separatorBuilder: (context, int idx) => const Divider(
                          color: Color.fromRGBO(241, 243, 248, 1),
                          thickness: 3,
                        ),
                    itemCount: 3)),
            SettingMenu(
              subscribe: false,
              height: 66,
              content: ListTile(
                title: const Text(
                  "로그아웃",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                // onTap: () => showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return CustomDialog(
                //         contentdetailText: "로그아웃 하시겠습니까?",
                //         buttonText: '취소',
                //         buttonSubText: "확인",
                //       );
                //     })
                onTap: () => getCustomDialog(
                  context,
                  buttonText: "취소",
                  buttonSubText: "확인",
                  contentdetailText: "로그아웃 하시겠습니까?",
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: RootTab(),
    );
  }
}
