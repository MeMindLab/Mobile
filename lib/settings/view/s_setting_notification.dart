import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/component/settings_menu.dart';

class SettingNotification extends StatefulWidget {
  const SettingNotification({super.key});

  @override
  State<SettingNotification> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SettingNotification> {
  bool isService = false;
  bool isAdvertise = false;
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
        title: "알림 설정",
        appBarLeading: const BackArrowLeading(),
        backgroundColor: theme.appColors.userInputBackground,
        appBarBgColor: theme.appColors.userInputBackground,
        child: CustomScrollView(
          physics: NeverScrollableScrollPhysics(),
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
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          leading: Text(
                            "서비스 알림 수신 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: Switch(
                            value: isService,
                            trackOutlineColor:
                                MaterialStateProperty.resolveWith(
                              (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return null;
                                }

                                return Colors.transparent;
                              },
                            ),
                            activeColor: theme.appColors.grayButtonBackground,
                            onChanged: (bool value) {
                              setState(() {
                                isService = !isService;
                              });
                            },
                          ),
                        ),
                        subscribe: false,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SettingMenu(
                        height: 65,
                        content: ListTile(
                          contentPadding: EdgeInsets.only(left: 20, right: 20),
                          leading: Text(
                            "광고성 정보 수신 설정",
                            style: FontSizes.getHeadline2Style()
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: Switch(
                            value: isAdvertise,
                            trackOutlineColor:
                                MaterialStateProperty.resolveWith(
                              (final Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return null;
                                }

                                return Colors.transparent;
                              },
                            ),
                            activeColor: theme.appColors.grayButtonBackground,
                            onChanged: (bool value) {
                              setState(() {
                                isAdvertise = !isAdvertise;
                              });
                            },
                          ),
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
