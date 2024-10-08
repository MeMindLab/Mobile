import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/settings/view/s_withdraw_screen.dart';

class WithdrawNoticeFragment extends StatefulWidget {
  final Function(ScreenState) screenUpdate;
  const WithdrawNoticeFragment({super.key, required this.screenUpdate});

  @override
  State<WithdrawNoticeFragment> createState() => _WithdrawNoticeFragmentState();
}

class _WithdrawNoticeFragmentState extends State<WithdrawNoticeFragment> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        noticeElement(theme),
        const SizedBox(
          height: 20,
        ),
        noticeContent(),
        const Spacer(),
        InkWell(
            onTap: () {
              setState(() {
                isCheck = !isCheck;
              });
            },
            child: checkTile(
                isSelect: isCheck, content: "위 사항을 확인했으며, 이에 동의합니다.")),
        const SizedBox(
          height: 25,
        ),
        isCheck == true
            ? RoundedButton(
                text: "다음",
                onPressed: () {
                  widget.screenUpdate(ScreenState.password);
                },
              )
            : const RoundedButton(text: "다음"),
        const SizedBox(
          height: 30,
        )
      ],
    );
  }
}

Widget checkTile({required bool isSelect, required String content}) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: SvgPicture.asset(
          'assets/svg/icon/check_all.svg',
          width: 13,
          height: 13,
          fit: BoxFit.fitWidth,
          colorFilter: isSelect == true
              ? const ColorFilter.mode(AppColors.blue9, BlendMode.srcIn)
              : null,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      Expanded(
          child: Text(
        content,
        style: FontSizes.getCapsuleStyle().copyWith(
            fontWeight: FontWeight.w500,
            color: isSelect ? AppColors.blue9 : AppColors.gray7),
      )),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}

Widget noticeElement(CustomTheme theme) {
  return Container(
    padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
    decoration: BoxDecoration(
      color: lightTheme.primaryColorDark,
      borderRadius: BorderRadius.circular(13),
    ),
    child: Row(
      children: [
        Image.asset(
          "assets/image/icon/warning.png",
          width: 24,
          height: 24,
          color: theme.appColors.seedColor,
        ),
        const SizedBox(
          width: 9,
        ),
        Flexible(
          child: Text(
            "아래 항목을 확인해주세요!",
            style: FontSizes.getContentStyle().copyWith(
                color: theme.appColors.seedColor, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}

Widget noticeContent() {
  return Container(
    width: double.infinity,
    decoration: const BoxDecoration(
      color: AppColors.blue1,
      borderRadius: BorderRadius.all(Radius.circular(25)),
    ),
    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
    child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "1.",
            style: FontSizes.getContentStyle()
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray9),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            "탈퇴 후 계정 복구가 불가합니다.\n(동일 이메일로 가입 불가)",
            style: FontSizes.getContentStyle()
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray9),
          ),
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "2.",
            style: FontSizes.getContentStyle()
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray9),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "탈퇴 후, 일기 작성내역과 리포트 데이터 등은 복구 불가합니다.",
              style: FontSizes.getContentStyle().copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.gray9),
            ),
          ),
        ],
      ),
      const SizedBox(
        height: 16,
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "3.",
            style: FontSizes.getContentStyle()
                .copyWith(fontWeight: FontWeight.w400, color: AppColors.gray9),
          ),
          const SizedBox(
            width: 5,
          ),
          Expanded(
            child: Text(
              "탈퇴 시, 보유하고 계신 레몬은 전부 소멸됩니다. 재가입을 하더라도 현재의 레몬은 살릴 수가 없습니다.",
              style: FontSizes.getContentStyle().copyWith(
                  fontWeight: FontWeight.w400, color: AppColors.gray9),
            ),
          ),
        ],
      ),
    ]),
  );
}
