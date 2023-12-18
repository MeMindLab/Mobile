// ignore_for_file: sort_child_properties_last
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_dialog.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/view/s_report_detail.dart';
import 'package:me_mind/settings/component/certified_box.dart';
import 'package:me_mind/settings/component/settings_menu.dart';
import 'package:me_mind/settings/view/s_setting_opinion.dart';
import 'package:me_mind/settings/view/s_setting_tema.dart';
import 'package:me_mind/settings/view/s_setting_userinfo.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  @override
  void initState() {
    super.initState();
    setBottomIdx(3);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final settingmenus = ['FAQ', '이용 약관', '개인정보 처리방침'];
    return DefaultLayout(
      title: "설정",
      backgroundColor: theme.appColors.userInputBackground,
      appBarActions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Row(
            children: [
              SvgPicture.asset('assets/svg/icon/vitamin.svg'),
              Text('10',
                  style: FontSizes.getHeadline1Style()
                      .copyWith(color: theme.appColors.iconButton)),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Stack(children: [
                SettingMenu(
                  subscribe: true,
                  height: 97,
                  content: ListTile(
                    title: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "구독플랜",
                          style: FontSizes.getHeadline1Style()
                              .copyWith(color: theme.appColors.seedColor),
                        ),
                        Text(
                          "무료 멤버십",
                          style: FontSizes.getHeadline2Style()
                              .copyWith(color: theme.appColors.seedColor),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: 102,
                      height: 41,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(13))),
                      child: TextButton(
                        child: Center(
                            child: Text(
                          "pro 구독",
                          style: FontSizes.getContentStyle()
                              .copyWith(color: AppColors.gray9),
                        )),
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          backgroundColor: lightTheme.primaryColor,
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
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.ios_share,
                          color: theme.appColors.seedColor,
                        ),
                        Text(
                          "1월 중 오픈 예정",
                          style: FontSizes.getContentStyle()
                              .copyWith(color: theme.appColors.seedColor),
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
                      Text(
                        "계정정보",
                        style: FontSizes.getHeadline2Style()
                            .copyWith(color: theme.appColors.iconButton),
                      ),
                      CertifiedBox(isCertified: true),
                    ],
                  ),
                ),
              ),
              SettingMenu(
                subscribe: false,
                height: 66,
                content: ListTile(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: ((BuildContext context,
                                  Animation<double> animation1,
                                  Animation<double> animation2) =>
                              const SettingTema()),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ));
                  },
                  title: Text(
                    "테마 설정하기",
                    style: FontSizes.getHeadline2Style()
                        .copyWith(color: theme.appColors.iconButton),
                  ),
                ),
              ),
              SettingMenu(
                subscribe: false,
                height: 66,
                content: ListTile(
                  onTap: () {
                    print("의견 보내기");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SettingOpinion()));
                  },
                  title: Text(
                    "의견 보내기",
                    style: FontSizes.getHeadline2Style()
                        .copyWith(color: theme.appColors.iconButton),
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
                            style: FontSizes.getHeadline2Style()
                                .copyWith(color: theme.appColors.iconButton),
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
                  title: Text(
                    "로그아웃",
                    style: FontSizes.getHeadline2Style()
                        .copyWith(color: theme.appColors.iconButton),
                  ),
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
      ),
      bottomNavigationBar: RootTab(),
    );
  }
}
