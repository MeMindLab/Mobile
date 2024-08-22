import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_mind/common/component/dialog/custom_dialog.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/services/image_picker_service.dart';
import 'package:me_mind/settings/utils/email_send.dart';
import 'package:me_mind/settings/view/s_collect_use_screen.dart';
import 'package:me_mind/settings/view/s_setting.dart';

class SettingOpinion extends StatefulWidget {
  const SettingOpinion({super.key});

  @override
  State<SettingOpinion> createState() => _SettingOpinionState();
}

class _SettingOpinionState extends State<SettingOpinion> {
  bool infoCheck = false;
  List opinionList = [];
  String subject = "";
  String body = "";
  List<String> attachments = [];

  setOpinionList(value) async {
    if (value != null) {
      setState(() {
        opinionList.add(value);
        attachments.add(value.path);
      });
    }
  }

  Widget buildTextField(
      {required Color bgColor,
      int? maxLines,
      String? hintText,
      ValueChanged<String>? onChanged}) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
      child: SeetingCustomTextFormField(
          hintText: hintText,
          onChanged: onChanged!,
          maxLines: maxLines,
          bgColor: bgColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
      title: "의견보내기",
      backgroundColor: theme.appColors.seedColor,
      appBarLeading: const BackArrowLeading(),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: lightTheme.primaryColorDark,
                      borderRadius: BorderRadius.circular(13),
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset('assets/svg/icon/volume-up.svg'),
                        SizedBox(
                          width: 9,
                        ),
                        Flexible(
                          child: Text(
                            "memind를 이용하며 생긴 궁금한 점이나, \n관련하여 전달하고픈 피드백을 넘겨주세요.",
                            style: FontSizes.getContentStyle()
                                .copyWith(color: theme.appColors.seedColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24.5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "제목",
                      style: FontSizes.getHeadline1Style()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(
                      onChanged: (String value) {
                        setState(() {
                          subject = value;
                        });
                      },
                      hintText: "제목을 입력해주세요",
                      bgColor: AppColors.blue1),
                  const SizedBox(
                    height: 14.5,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "내용",
                      style: FontSizes.getHeadline1Style()
                          .copyWith(color: theme.appColors.iconButton),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  buildTextField(
                      onChanged: (String value) {
                        setState(() {
                          body = value;
                        });
                      },
                      maxLines: 8,
                      hintText: "내용을 입력해주세요",
                      bgColor: AppColors.blue1),
                  const SizedBox(
                    height: 14.5,
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    width: double.infinity,
                    height: 100,
                    padding: const EdgeInsets.all(0),
                    child: GridView.builder(
                        itemCount: opinionList.length + 1,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (_, int idx) {
                          if (idx == 0) {
                            return InkWell(
                              onTap: () async {
                                var result = await ImagePickerService(
                                        imagePicker: ImagePicker())
                                    .getImage(ImageSource.gallery);
                                if (result != null) {
                                  await setOpinionList(result);
                                }
                              },
                              child: Container(
                                width: 85,
                                height: 85,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.blue1),
                                child: const Center(
                                    child: Icon(
                                  Icons.add,
                                  color: AppColors.gray5,
                                  size: 35,
                                )),
                              ),
                            );
                          } else {
                            return Container(
                              width: 85,
                              height: 85,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(opinionList[idx - 1].path)),
                                      fit: BoxFit.cover)),
                              child: Stack(children: [
                                Positioned(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        opinionList = [];
                                        attachments = [];
                                      });
                                    },
                                    child: Icon(
                                      Icons.close,
                                      color: theme.appColors.seedColor,
                                      size: 30,
                                    ),
                                  ),
                                  top: 1,
                                  right: 1,
                                ),
                              ]),
                            );
                          }
                        }),
                  ),
                  const Spacer(),
                  // 수집 안내문
                  SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          infoCheck = !infoCheck;
                        });
                      },
                      child: Row(children: [
                        Container(
                            padding: const EdgeInsets.only(left: 5),
                            width: 24,
                            height: 24,
                            child: SvgPicture.asset(
                              'assets/svg/icon/check_all.svg',
                              width: 24,
                              height: 24,
                              fit: BoxFit.scaleDown,
                              colorFilter: infoCheck
                                  ? ColorFilter.mode(
                                      theme.appColors.confirmText,
                                      BlendMode.srcIn)
                                  : null,
                            )),
                        Flexible(
                            child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: RichText(
                            text: TextSpan(
                                text: "수집된 정보는 의견에 대한 답변 목적으로 활용되며,\n의견을 보내시면 ",
                                style: FontSizes.getCapsuleStyle().copyWith(
                                    color: theme.appColors.hintText,
                                    fontWeight: FontWeight.w400),
                                children: [
                                  WidgetSpan(
                                      child: InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return const CollectUseScreen();
                                      }));
                                    },
                                    child: Text(
                                      "개인정보 수집 및 이용",
                                      style:
                                          FontSizes.getCapsuleHighlightStyle()
                                              .copyWith(
                                        color: theme.appColors.hintText,
                                        fontWeight: FontWeight.w400,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  )),
                                  const TextSpan(text: "에 동의하게 됩니다"),
                                ]),
                          ),
                        ))
                      ]),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  RoundedButton(
                    onPressed: infoCheck == true && subject != "" && body != ""
                        ? () {
                            EmailSend.send(
                                    subject: subject,
                                    body: body,
                                    attachments: attachments)
                                .then((value) async {
                              DialogManager(
                                      context: context,
                                      type: DialogType.oneButton)
                                  .show(
                                titleText: "의견을 성공적으로 보냈어요!",
                                contentText: "답변은 추후 등록한 이메일로 전송됩니다.",
                                firstButtonText: "닫기",
                                firstSubmit: () {
                                  Navigator.pop(context);
                                },
                              );

                              await Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: ((BuildContext context,
                                            Animation<double> animation1,
                                            Animation<double> animation2) =>
                                        Settings()),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ));
                            });
                          }
                        : null,
                    text: "의견 보내기",
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
