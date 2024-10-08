import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/provider/chat_provider.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/layout/topbar/widget/lemon_number.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';
import 'package:me_mind/common/view/splash_screen.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/provider/report_id_provider.dart';
import 'package:me_mind/report/provider/report_search_provider.dart';
import 'package:me_mind/settings/component/certified_box.dart';
import 'package:me_mind/settings/component/settings_menu.dart';
import 'package:me_mind/settings/view/s_faqwebview_screen.dart';
import 'package:me_mind/settings/view/s_personal_policy_screen.dart';
import 'package:me_mind/settings/view/s_service_use_screen.dart';
import 'package:me_mind/settings/view/s_setting_notification.dart';
import 'package:me_mind/settings/view/s_setting_opinion.dart';
import 'package:me_mind/settings/view/s_setting_theme.dart';
import 'package:me_mind/settings/view/s_setting_userinfo.dart';
import 'package:me_mind/settings/view/s_subscribe.dart';

class Settings extends ConsumerStatefulWidget {
  const Settings({super.key});

  @override
  ConsumerState<Settings> createState() => _SettingState();
}

class _SettingState extends ConsumerState<Settings> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    // setBottomIdx(3);
    ref.read(userStateNotifierProvider.notifier).userInit();
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    // 메뉴 모음
    final settingmenus = ['FAQ', '이용 약관', '개인정보 처리방침'];
    final user = ref.watch(userStateNotifierProvider);

    if (user is UserDetailModelFailed) {
      return DefaultLayout(
          title: "설정",
          backgroundColor: AppColors.blue1,
          appBarBgColor: AppColors.blue1,
          appBarActions: [LemonNumberWidget()],
          appBarLeading: const BackArrowLeading(),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.38,
              ),
              const Center(
                child: Text("계정정보를 불러오지 못했습니다."),
              ),
            ],
          ));
    }
    return DefaultLayout(
      title: "설정",
      backgroundColor: AppColors.blue1,
      appBarBgColor: AppColors.blue1,
      appBarActions: [LemonNumberWidget()],
      appBarLeading: const BackArrowLeading(),
      // 설정 화면 Body
      child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: user.isVerified != null
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Stack(children: [
                        SettingMenu(
                          subscribe: true,
                          height: 93,
                          content: ListTile(
                            title: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "구독플랜",
                                  style: FontSizes.getHeadline1Style().copyWith(
                                      color: theme.appColors.seedColor),
                                ),
                                Text(
                                  "무료 멤버십",
                                  style: FontSizes.getHeadline2Style().copyWith(
                                      color: theme.appColors.seedColor),
                                ),
                              ],
                            ),
                            trailing: Container(
                              width: 102,
                              height: 41,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(13))),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  backgroundColor: lightTheme.primaryColor,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(13))),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const SubscribePage()));
                                },
                                child: Center(
                                    child: Text(
                                  "pro 구독",
                                  style: FontSizes.getContentStyle()
                                      .copyWith(color: AppColors.gray9),
                                )),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          child: Container(
                            width: double.infinity,
                            height: 93,
                            decoration: BoxDecoration(
                                color: AppColors.blackColor.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(13)),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/svg/icon/market.svg',
                                  width: 24,
                                  height: 24,
                                ),
                                Text(
                                  "오픈 예정",
                                  style: FontSizes.getContentStyle().copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: theme.appColors.seedColor),
                                )
                              ],
                            )),
                          ),
                        )
                      ]),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        subscribe: false,
                        height: 65,
                        content: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SettingUserInfo(
                                          userEmail: user.email,
                                          userNickname: user.name,
                                          phoneNumber: user.phoneNumber,
                                          isVerified: user.isVerified!,
                                          referralCode: user.referralCode,
                                        )));
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "계정정보",
                                style: FontSizes.getHeadline2Style().copyWith(
                                    color: theme.appColors.iconButton),
                              ),
                              CertifiedBox(isCertified: user.isVerified!),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        subscribe: false,
                        height: 65,
                        content: ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: ((BuildContext context,
                                          Animation<double> animation1,
                                          Animation<double> animation2) =>
                                      const SettingTheme()),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          title: Text(
                            "테마 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(color: theme.appColors.iconButton),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        subscribe: false,
                        height: 65,
                        content: ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: ((BuildContext context,
                                          Animation<double> animation1,
                                          Animation<double> animation2) =>
                                      const SettingNotification()),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          title: Text(
                            "알림 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(color: theme.appColors.iconButton),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        subscribe: false,
                        height: 65,
                        content: ListTile(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SettingOpinion()));
                          },
                          title: Text(
                            "의견 보내기",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(color: theme.appColors.iconButton),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                          subscribe: false,
                          height: 198,
                          content: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext contexnt, int idx) {
                                List pages = [
                                  const FaqWebviewScreen(),
                                  const ServiceUseScreen(),
                                  const PersonalPolicyScreen()
                                ];
                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return pages[idx];
                                    }));
                                  },
                                  child: ListTile(
                                    visualDensity:
                                        const VisualDensity(vertical: -1),
                                    title: Text(
                                      settingmenus[idx],
                                      style: FontSizes.getHeadline2Style()
                                          .copyWith(
                                              color:
                                                  theme.appColors.iconButton),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder: (context, int idx) =>
                                  const Divider(
                                    color: AppColors.blue1,
                                    thickness: 3,
                                  ),
                              itemCount: 3)),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                          subscribe: false,
                          height: 65,
                          content: ListTile(
                              title: Text(
                                "로그아웃",
                                style: FontSizes.getHeadline2Style().copyWith(
                                    color: theme.appColors.iconButton),
                              ),
                              onTap: () {
                                DialogManager(
                                        context: context,
                                        type: DialogType.twoButton)
                                    .show(
                                        titleText: "로그아웃 하시겠어요?",
                                        firstButtonText: "네",
                                        firstSubmit: () async {
                                          ref.invalidate(
                                              userStateNotifierProvider);

                                          ref.invalidate(
                                              chatStateNotifierProvider);
                                          ref.invalidate(reportIdProvider);
                                          ref.invalidate(reportProvider);
                                          ref.invalidate(reportSearchProvider);
                                          ref.invalidate(
                                              lemonStateNotifierProvider);
                                          await storage.deleteAll();

                                          await Navigator.of(context)
                                              .pushReplacement(MaterialPageRoute(
                                                  builder: (_) =>
                                                      const SplashScreen()));
                                        },
                                        secondButtonText: "아니오",
                                        secondSubmit: () {
                                          Navigator.pop(context);
                                        });
                              }))
                    ],
                  ),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.38,
                    ),
                    const Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )),
    );
  }
}
