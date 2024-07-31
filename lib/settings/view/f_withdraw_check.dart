import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/model/withdraw_reason.dart';
import 'package:me_mind/settings/view/f_withdraw_notice.dart';
import 'package:me_mind/settings/view/s_withdraw_screen.dart';

class WidthdrawCheckFragment extends StatefulWidget {
  final Function(String) reasonUpdate;
  final Function(ScreenState) screenUpdate;

  const WidthdrawCheckFragment(
      {super.key, required this.reasonUpdate, required this.screenUpdate});

  @override
  State<WidthdrawCheckFragment> createState() => _WidthdrawCheckFragmentState();
}

class _WidthdrawCheckFragmentState extends State<WidthdrawCheckFragment> {
  WithdrawReason withdrawReason = WithdrawReason(
      inconveninece: false,
      point: false,
      disabled: false,
      userInfo: false,
      custom: false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              color: AppColors.blue1,
              borderRadius: BorderRadius.all(Radius.circular(25))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(children: [
              Image.asset(
                "assets/image/logo/crying_new_logo.png",
                width: 92,
                height: 89,
              ),
              const SizedBox(
                height: 24,
              ),
              Text(
                "부족한 점이 많은 미마인드이지만\n여러분의 관심과 피드백으로 개선해나가고 싶어요!\n탈퇴하시려는 이유를 여쭤봐도 될까요?",
                style: FontSizes.getContentStyle()
                    .copyWith(fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              )
            ]),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        InkWell(
          onTap: () {
            setState(() {
              withdrawReason = withdrawReason.update(inconveninece: true);
            });
          },
          child: checkTile(
              isSelected: withdrawReason.inconveninece,
              content: "이용이 불편하고 장애가 많아요"),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
            onTap: () {
              setState(() {
                withdrawReason = withdrawReason.update(point: true);
              });
            },
            child: checkTile(
                isSelected: withdrawReason.point, content: "포인트를 다 써버렸어요")),
        const SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            setState(() {
              withdrawReason = withdrawReason.update(disabled: true);
            });
          },
          child: checkTile(
              isSelected: withdrawReason.disabled, content: "자주 사용하지 않을 것 같아요"),
        ),
        const SizedBox(
          height: 30,
        ),
        InkWell(
            onTap: () {
              setState(() {
                withdrawReason = withdrawReason.update(userInfo: true);
              });
            },
            child: checkTile(
                isSelected: withdrawReason.userInfo, content: "개인 정보가 걱정돼요")),
        const SizedBox(
          height: 25,
        ),
        InkWell(
            onTap: () {
              setState(() {
                withdrawReason = withdrawReason.update(custom: true);
              });
            },
            child: checkTile(isSelected: withdrawReason.custom, content: "")),
        const Spacer(),
        RoundedButton(
          text: "다음",
          onPressed: () {
            String text = "";
            if (withdrawReason.custom != true) {
              text = withdrawReason.getReason();
            } else {
              text = withdrawReason.getReason(text: "");
            }
            widget.reasonUpdate(text);
            widget.screenUpdate(ScreenState.notice);
          },
        ),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

Widget checkTile({required bool isSelected, required String? content}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: SvgPicture.asset(
          'assets/svg/icon/check.svg',
          width: 24,
          height: 24,
          colorFilter: isSelected == true
              ? const ColorFilter.mode(AppColors.blue9, BlendMode.srcIn)
              : null,
        ),
      ),
      SizedBox(
        width: content != "" ? 20 : 7,
      ),
      Expanded(
        child: content != ""
            ? Text(
                content!,
                style: FontSizes.getContentStyle().copyWith(
                    fontWeight: FontWeight.w500,
                    color: isSelected ? AppColors.blue9 : null),
              )
            : SeetingCustomTextFormField(
                onChanged: (value) {},
                bgColor: AppColors.gray1,
                hintText: "탈퇴 사유를 직접 입력해주세요",
              ),
      ),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}
