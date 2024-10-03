import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/s_collect_use_screen.dart';
import 'package:me_mind/settings/view/s_service_use_screen.dart';
import 'package:me_mind/user/component/custom_checkbox.dart';
import 'package:me_mind/user/provider/agree_provider.dart';

class AgreeCheckSetComponent extends ConsumerStatefulWidget {
  const AgreeCheckSetComponent({super.key});

  @override
  ConsumerState<AgreeCheckSetComponent> createState() => _MyWidgetState();
}

class _MyWidgetState extends ConsumerState<AgreeCheckSetComponent> {
  @override
  Widget build(BuildContext context) {
    final agree = ref.watch(agreeStateNotifierProvider);
    final theme = CustomThemeHolder.of(context).theme;

    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context, () {
              setState(() {});
            });
          },
          child: Image.asset("assets/image/icon/arrow_down.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              "약관에 동의해주세요",
              style: FontSizes.getHeadline1Style()
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            const Spacer()
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            Text(
              "여러분의 개인정보와 서비스 이용 권리를\n잘 지켜드릴게요.",
              style: FontSizes.getContentStyle()
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const Spacer(),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        CustomCheckBox(
          title: "전체 동의",
          isBold: true,
          svg: "check_all.svg",
          padding: EdgeInsets.zero,
          isChecked: agree.isAll,
          onChanged: () {
            ref
                .read(agreeStateNotifierProvider.notifier)
                .updateAll(isTrue: !agree.isAll);
          },
        ),
        const Padding(
          padding: EdgeInsets.only(bottom: 5, top: 6),
          child: Divider(),
        ),
        CustomCheckBox(
            title: "[필수] 서비스 이용약관 동의",
            svg: "check.svg",
            isChecked: agree.isService,
            padding: EdgeInsets.zero,
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ServiceUseScreen();
                }));
              },
              child: Text("보기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.hintText)),
            ),
            onChanged: () {
              ref
                  .read(agreeStateNotifierProvider.notifier)
                  .updateService(isTrue: !agree.isService);
            }),
        const SizedBox(height: 6),
        CustomCheckBox(
            title: "[필수] 개인정보 수집 및 이용 동의",
            svg: "check.svg",
            isChecked: agree.isPersonalInfo,
            padding: EdgeInsets.zero,
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CollectUseScreen();
                }));
              },
              child: Text("보기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.hintText)),
            ),
            onChanged: () {
              ref
                  .read(agreeStateNotifierProvider.notifier)
                  .updatePersonal(isTrue: !agree.isPersonalInfo);
            }),
        const SizedBox(height: 6),
        CustomCheckBox(
            title: "[선택] 앱 Push 수신 동의",
            svg: "check.svg",
            isChecked: agree.isAppPush,
            padding: EdgeInsets.zero,
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ServiceUseScreen();
                }));
              },
              child: Text("보기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.hintText)),
            ),
            onChanged: () {
              ref
                  .read(agreeStateNotifierProvider.notifier)
                  .updateAppPush(isTrue: !agree.isAppPush);
            }),
        const SizedBox(height: 6),
        CustomCheckBox(
            title: "[선택] 광고성 정보 수신 동의",
            svg: "check.svg",
            isChecked: agree.isAdvertising,
            padding: EdgeInsets.zero,
            trailing: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const ServiceUseScreen();
                }));
              },
              child: Text("보기",
                  style: FontSizes.getCapsuleStyle()
                      .copyWith(color: theme.appColors.hintText)),
            ),
            onChanged: () {
              ref
                  .read(agreeStateNotifierProvider.notifier)
                  .updateAdverTising(isTrue: !agree.isAdvertising);
            }),
      ],
    );
  }
}
