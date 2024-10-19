import 'package:flutter/material.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/settings/component/custom_switch.dart';
import 'package:me_mind/settings/component/settings_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingNotification extends StatefulWidget {
  const SettingNotification({super.key});

  @override
  State<SettingNotification> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingNotification> {
  bool isService = false;
  bool isAdvertise = false;
  late ScaffoldMessengerState scaffoldMessenger;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    scaffoldMessenger = ScaffoldMessenger.of(context);
  }

  @override
  void dispose() {
    setInfoState();
    scaffoldMessenger.clearSnackBars();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getInfoState();
  }

  getInfoState() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      isAdvertise = prefs.getBool("adverTisingAccept") ?? false;
      isService = prefs.getBool("appPushAccept") ?? false;
    });
  }

  setInfoState() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('adverTisingAccept', isAdvertise);
    await prefs.setBool('appPushAccept', isService);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "알림 설정",
        appBarLeading: const BackArrowLeading(),
        backgroundColor: AppColors.blue1,
        appBarBgColor: AppColors.blue1,
        child: CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SettingMenu(
                        height: 65,
                        content: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          leading: Text(
                            "서비스 알림 수신 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomSwitch(
                              value: isService,
                              onChanged: (bool value) {
                                ShowSnackBar().showBottomSnackBar(
                                    context,
                                    !isService == false
                                        ? "서비스 알림 수신이 거부되었습니다."
                                        : "서비스 알림 수신이 승인되었습니다.");

                                setState(() {
                                  isService = !isService;
                                });
                              }),
                        ),
                        subscribe: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        height: 65,
                        content: ListTile(
                          contentPadding:
                              const EdgeInsets.only(left: 20, right: 20),
                          leading: Text(
                            "광고성 정보 수신 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: CustomSwitch(
                              value: isAdvertise,
                              onChanged: (bool value) {
                                ShowSnackBar().showBottomSnackBar(
                                    context,
                                    !isAdvertise == false
                                        ? "광고성 정보 수신이 거부되었습니다."
                                        : "광고성 정보 수신이 승인되었습니다.");
                                setState(() {
                                  isAdvertise = !isAdvertise;
                                });
                              }),
                        ),
                        subscribe: false,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
