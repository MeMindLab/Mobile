import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/model/withdraw_reason.dart';
import 'package:me_mind/settings/view/s_withdraw_notice.dart';

class WithdrawCheckScreen extends StatefulWidget {
  const WithdrawCheckScreen({super.key});

  @override
  State<WithdrawCheckScreen> createState() => _WidthdrawCheckFragmentState();
}

class _WidthdrawCheckFragmentState extends State<WithdrawCheckScreen> {
  String customReason = "";
  WithdrawReason withdrawReason = WithdrawReason(
      inconveninece: false,
      point: false,
      disabled: false,
      userInfo: false,
      custom: false);

  void writeReason(String value) {
    setState(() {
      customReason = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
        title: "계정 탈퇴",
        appBarLeading: const BackArrowLeading(),
        child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
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
                        withdrawReason = withdrawReason.update(
                            inconveninece: !withdrawReason.inconveninece);
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
                          withdrawReason = withdrawReason.update(
                              point: !withdrawReason.point);
                        });
                      },
                      child: checkTile(
                          isSelected: withdrawReason.point,
                          content: "포인트를 다 써버렸어요")),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        withdrawReason = withdrawReason.update(
                            disabled: !withdrawReason.disabled);
                      });
                    },
                    child: checkTile(
                        isSelected: withdrawReason.disabled,
                        content: "자주 사용하지 않을 것 같아요"),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                      onTap: () {
                        setState(() {
                          withdrawReason = withdrawReason.update(
                              userInfo: !withdrawReason.userInfo);
                        });
                      },
                      child: checkTile(
                          isSelected: withdrawReason.userInfo,
                          content: "개인 정보가 걱정돼요")),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            withdrawReason = withdrawReason.update(
                                custom: !withdrawReason.custom);
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: SvgPicture.asset(
                            'assets/svg/icon/check.svg',
                            width: 24,
                            height: 24,
                            colorFilter: withdrawReason.custom == true
                                ? const ColorFilter.mode(
                                    AppColors.blue9, BlendMode.srcIn)
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: SeetingCustomTextFormField(
                          enabled: withdrawReason.custom,
                          onChanged: writeReason,
                          bgColor: AppColors.gray1,
                          hintText: "탈퇴 사유를 직접 입력해주세요",
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                  const Spacer(),
                  withdrawReason.isNotCheck()
                      ? const RoundedButton(text: "다음")
                      : RoundedButton(
                          text: "다음",
                          onPressed: () {
                            List reasons = [];
                            if (withdrawReason.custom != true) {
                              reasons = withdrawReason.getReason();
                            } else {
                              reasons =
                                  withdrawReason.getReason(text: customReason);
                            }
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return WithdrawNoticeScreen(
                                reasons: reasons,
                              );
                            }));
                          },
                        ),
                  const SizedBox(
                    height: 30,
                  )
                ],
              )),
        ));
  }
}

Widget checkTile({
  required bool isSelected,
  required String? content,
  Function? onChanged,
}) {
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
      const SizedBox(
        width: 20,
      ),
      Expanded(
          child: Text(
        content!,
        style: FontSizes.getContentStyle().copyWith(
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.blue9 : null),
      )),
      const SizedBox(
        width: 5,
      ),
    ],
  );
}
