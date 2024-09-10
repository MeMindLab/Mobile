import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
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
          height: 25,
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
          height: 10,
        ),
        CustomCheckBox(
          title: "전체 동의",
          isBold: true,
          svg: "check_all.svg",
          isChecked: agree.isAll,
          onChanged: () {
            ref
                .read(agreeStateNotifierProvider.notifier)
                .updateAll(isTrue: !agree.isAll);
          },
        ),
      ],
    );
  }
}
