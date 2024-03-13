import 'package:flutter/material.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/component/subscribe_box.dart';
import 'package:me_mind/settings/view/w_gradient_text.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key});

  @override
  State<SubscribePage> createState() => _SettingUserInfoState();
}

class _SettingUserInfoState extends State<SubscribePage> {
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;

    return DefaultLayout(
        title: "구독하기",
        appBarLeading: const BackArrowLeading(),
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
                  child: Column(
                    children: [
                      GradientText(
                        text: "pro플랜을 구독하고,\n다양한 혜택들을 누리세요!",
                        gradient: const LinearGradient(
                          colors: [
                            Color.fromRGBO(43, 51, 245, 1),
                            Color.fromRGBO(3, 107, 255, 1),
                            Color.fromRGBO(81, 153, 255, 1),
                          ],
                        ),
                        style: FontSizes.getHeadline1Style().copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                      SubscribeBox(
                        imagePath: "assets/image/icon/subscribe.png",
                        title: "일기봇 캐릭터 바꾸기",
                        subTitle: "AI 일기봇과 나눈 대화를 7가지 감정에 기반하여 분석해볼 수 있어요",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SubscribeBox(
                        imagePath: "assets/image/icon/subscribe.png",
                        title: "일기봇 캐릭터 바꾸기",
                        subTitle: "AI 일기봇과 나눈 대화를 7가지 감정에 기반하여 분석해볼 수 있어요",
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SubscribeBox(
                        imagePath: "assets/image/icon/subscribe.png",
                        title: "일기봇 캐릭터 바꾸기",
                        subTitle: "AI 일기봇과 나눈 대화를 7가지 감정에 기반하여 분석해볼 수 있어요",
                      ),
                      const Spacer(),
                      RoundedButton(
                        text: "문의하기",
                        backgroundColor: theme.appColors.grayButtonBackground,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
