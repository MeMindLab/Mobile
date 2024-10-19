import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_mind/chat/component/chat_message_tile.dart';
import 'package:me_mind/chat/component/chat_mic.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/model/image_upload_model.dart';
import 'package:me_mind/chat/provider/chat_id_provider.dart';
import 'package:me_mind/chat/provider/chat_provider.dart';
import 'package:me_mind/chat/provider/report_issue_provider.dart';
import 'package:me_mind/chat/services/image_picker_service.dart';
import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';
import 'package:me_mind/report/provider/report_create_provider.dart';
import 'package:me_mind/report/provider/report_id_provider.dart';
import 'package:me_mind/report/view/s_report_detail.dart';
import 'package:me_mind/screen/main/s_main.dart';
import 'package:me_mind/settings/view/s_setting.dart';
import 'package:me_mind/settings/view/s_setting_notification.dart';
import 'package:me_mind/settings/view/s_setting_userinfo.dart';

class Chat extends ConsumerStatefulWidget {
  String? seletedDate;

  Chat({super.key, this.seletedDate});

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  final GlobalKey _containerkey = GlobalKey();
  bool isMicOpen = false;
  double micWidth = 61.63;
  bool isFolded = false;
  double prefixHeight = 40;
  String chatContent = "";
  TextEditingController controller = TextEditingController();
  String dateFormatted = "";
  bool dialog1 = false;
  bool dialog2 = false;
  bool dialog3 = false;
  bool dialog4 = false;
  int chatImageCount = 0;

  void chatContentChange(String msg) {
    setState(() {
      chatContent = msg;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(chatStateNotifierProvider(widget.seletedDate));
    final chatId = ref.watch(chatIdProvider);
    final reportIssue = ref.watch(reportIssueProvider);
    final lemon = ref.watch(lemonStateNotifierProvider);
    final user = ref.watch(userStateNotifierProvider);
    final reportId = ref.watch(reportIdProvider);

    CustomTheme theme = CustomThemeHolder.of(context).theme;

    ref.listen(chatStateNotifierProvider(widget.seletedDate), (prev, next) {
      int imageCount = next.where((message) {
        if (message is ChatMessageModel) {
          return message.isImage;
        }
        return false;
      }).length;
      setState(() {
        chatImageCount = imageCount;
      });
    });

    ref.listen(reportIssueProvider, (previous, next) {
      if (next && lemon == 0) {
        if (user.isVerified != null) {
          if (user.isVerified! && dialog3 == false) {
            dialog3 = true;
            DialogManager(context: context, type: DialogType.twoButton).show(
                titleText: "데모버전 이용이 끝났어요.",
                contentText: "정식출시일을 기다려주세요!\n일기는 계속 작성 가능하며\n데이터는 보존할게요.",
                firstButtonText: "닫기",
                firstSubmit: () {
                  Navigator.pop(context);
                },
                secondButtonText: "이메일알림 받기",
                secondSubmit: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SettingNotification();
                  }));
                });
          } else if (user.isVerified == false && dialog4 == false) {
            dialog4 = true;
            DialogManager(context: context, type: DialogType.twoButton).show(
                titleText: "앗, 비타민이 없으시군요!",
                contentText: "리포트 발행은 비타민이 필요해요.\n번호인증 후 무료 5개를 받으시겠어요?",
                firstButtonText: "아니오",
                firstSubmit: () {
                  Navigator.pop(context);
                },
                secondButtonText: "네",
                secondSubmit: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const Settings();
                  }));
                });
          }
        }
      }
    });

    ref.listen(chatStateNotifierProvider(widget.seletedDate), (previous, next) {
      if (lemon == 1 &&
          next.length == 3 &&
          dialog1 == false &&
          user.isVerified! == false) {
        dialog1 = true;
        DialogManager(context: context, type: DialogType.twoButton).show(
            titleText: "꿀팁을 드릴께요!",
            contentText: "비타민이 있으면 리포트 발행이 가능해요.\n번호인증하고 비타민 5개를 받아볼까요?",
            firstButtonText: "아니오",
            firstSubmit: () {
              Navigator.pop(context);
            },
            secondButtonText: "네",
            secondSubmit: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const Settings();
              }));
            });
      }
      if (lemon == 0 &&
          next.length == 5 &&
          dialog2 == false &&
          user.isVerified! == true) {
        dialog2 = true;
        DialogManager(context: context, type: DialogType.twoButton).show(
            titleText: "참고해주세요!",
            contentText:
                "비타민이 소진되어 리포트 발행이 불가해요.\n추후 충전서비스가 출시될 예정이니\n조금만 기다려주세요.",
            firstButtonText: "닫기",
            firstSubmit: () {
              Navigator.pop(context);
            },
            secondButtonText: "이메일알림 받기",
            secondSubmit: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (context) {
                return const Settings();
              }));
            });
      }
    });

    ref.listen(reportCreateProvider, (previous, next) async {
      if (next is ReportCreateLoading) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ShowSnackBar().showSnackBarFunction(context, next.stateMsg);
      }
      if (next is ReportCreateFailed) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ShowSnackBar().showSnackBarDurationFunction(context, next.stateMsg);
      }

      if (next is ReportCreateSuccess) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ShowSnackBar().showSnackBarDurationFunction(context, next.stateMsg);
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ReportDetail(
              conversationId: chatId,
              reportId: reportId,
              createdAt: DateTime.now().toLocal().toIso8601String(),
            );
          }));
        });
      }
    });
    return DefaultLayout(
      backgroundColor: theme.appColors.seedColor,
      appBarActions: [
        InkWell(
          onTap: reportIssue == true
              ? () async {
                  ref
                      .read(reportCreateProvider.notifier)
                      .create(uuid: chatId, lemon: lemon);
                }
              : null,
          child: SizedBox(
            child: reportIssue == false
                ? Image.asset(
                    "assets/image/report/report_off.png",
                    width: 28,
                    height: 28,
                  )
                : Image.asset(
                    "assets/image/report/report_on.png",
                    width: 28,
                    height: 28,
                  ),
          ),
        ),
      ],
      title: datetimeType1(date: widget.seletedDate),
      // ignore: sort_child_properties_last
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  ListView.builder(
                    reverse: true,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      if (state[index] is ChatMessageLoading) {
                        return const ChatMessageTile(
                          message: "",
                          isAi: true,
                          isImage: false,
                          isAirequest: true,
                          createdAt: "",
                        );
                      } else if (state[index] is ChatMessageError) {
                        return const ChatMessageTile(
                          message: "다시 한번 입력해주세요",
                          isAi: true,
                          isImage: false,
                          createdAt: "",
                        );
                      } else {
                        return Padding(
                          padding: index == 0
                              ? EdgeInsets.zero
                              : index == state.length - 1
                                  ? const EdgeInsets.only(bottom: 10)
                                  : const EdgeInsets.only(bottom: 30.0),
                          child: ChatMessageTile.fromModel(
                              state[index], state[index] == 1 ? true : null),
                        );
                      }
                    },
                    itemCount: state.length,
                    padding: EdgeInsets.only(
                        top: isFolded ? 16 : 130,
                        bottom: 16,
                        left: 16,
                        right: 16),
                  ),
                  Positioned(
                    top:
                        isFolded ? -100 : 0, // isFolded가 true일 때 알림창을 화면 밖으로 이동
                    left: 0,
                    right: 0,
                    child: AnimatedOpacity(
                      opacity: isFolded ? 0.0 : 1.0, // 접히면 알림창을 숨김
                      duration: const Duration(milliseconds: 300),
                      child: isFolded == false
                          ? ChatNotification(
                              theme: theme,
                              isFolded: isFolded,
                              bgColor: theme.appColors.seedColor,
                              content:
                                  '구르미는 미마인드가 개발한 일기쓰기 전문 인공지능입니다. 텍스트나 음성으로 대화하듯이 하루를 정리해보세요!',
                              onPressed: () {
                                setState(() {
                                  isFolded = !isFolded;
                                });
                              })
                          : const SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            bottomInputField(controller, theme, chatContentChange),
          ],
        ),
      ),
      appBarLeading: BackArrowLeading(
        onPressed: () {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          } else {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => const MainScreen()));
          }
        },
      ),
    );
  }

  Widget bottomInputField(
      TextEditingController controller, CustomTheme theme, Function onChange) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  key: _containerkey,
                  constraints: const BoxConstraints(minHeight: 78),
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  decoration: BoxDecoration(
                    color: theme.appColors.userInputBackground,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(20, 0, 10, 10),
                            child: InkWell(
                              onTap: chatImageCount >= 2
                                  ? null
                                  : () async {
                                      var result = await ImagePickerService(
                                              imagePicker: ImagePicker())
                                          .getImage(ImageSource.gallery);

                                      if (result is! File) return;

                                      var imageUpload =
                                          await ImageUploadService().upload(
                                              result,
                                              ref.watch(chatIdProvider),
                                              false);

                                      if (imageUpload is! ImageUploadModel)
                                        return;
                                      ref
                                          .read(chatStateNotifierProvider(
                                                  widget.seletedDate)
                                              .notifier)
                                          .addChating(
                                              message: imageUpload.imageUrl,
                                              isImage: true);
                                    },
                              child: Transform.translate(
                                offset: Offset(2, -1),
                                child: SvgPicture.asset(
                                    'assets/svg/icon/imageUpload.svg',
                                    width: 26,
                                    height: 26,
                                    colorFilter: const ColorFilter.mode(
                                        AppColors.trashColor, BlendMode.srcIn)),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          // height: 40,
                          child: Stack(children: [
                            TextField(
                              controller: controller,
                              onChanged: (value) {
                                onChange(value);
                              },
                              showCursor: true,
                              minLines: 1,
                              maxLines: 4,
                              cursorWidth: 1,
                              cursorHeight: 17,
                              cursorColor: AppColors.blackColor,
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  color: theme.appColors.iconButton,
                                  fontSize: 14),
                              decoration: InputDecoration(
                                isDense: false,
                                contentPadding: const EdgeInsets.only(
                                    left: 20, right: 80, top: 5, bottom: 5),
                                filled: true,
                                fillColor: theme.appColors.seedColor,
                                labelStyle:
                                    TextStyle(color: theme.appColors.activate),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(23)),
                                    borderSide: BorderSide.none
                                    // borderSide: BorderSide(
                                    //     width: 1,
                                    //     color: theme.appColors.seedColor),
                                    ),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(23)),
                                    borderSide: BorderSide.none
                                    // borderSide: BorderSide(
                                    //     width: 1,
                                    //     color: theme.appColors.seedColor),
                                    ),
                                disabledBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(23)),
                                    borderSide: BorderSide.none),
                                errorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(23)),
                                    borderSide: BorderSide.none),
                                focusedErrorBorder: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(23)),
                                    borderSide: BorderSide.none),
                                border: const OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(23)),
                                    borderSide: BorderSide.none),
                              ),
                              keyboardType: TextInputType.multiline,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 6, bottom: 6),
                                      child: Container(
                                        width: 35,
                                        height: 35,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.blue7),
                                        child: InkWell(
                                          onTap: () async {
                                            if (chatContent != "") {
                                              ref
                                                  .read(
                                                      chatStateNotifierProvider(
                                                              widget
                                                                  .seletedDate)
                                                          .notifier)
                                                  .addChating(
                                                      message: chatContent);
                                              setState(() {
                                                chatContent = "";
                                              });

                                              controller.clear();
                                            }
                                          },
                                          child: Transform.translate(
                                            offset: Offset(0.5, -1),
                                            child: Image.asset(
                                              'assets/image/icon/chat_send_icon.png',
                                              width: 30,
                                              height: 30,
                                              color: theme.appColors.seedColor,
                                            ),
                                          ),
                                          // child: Icon(
                                          //   Icons.keyboard_arrow_up,
                                          //   color: theme.appColors.seedColor,
                                          //   size: 30,
                                          // ),
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
                if (isMicOpen == true) ...[
                  const ChatMicArea(),
                ],
              ],
            )),
      ),
    );
  }
}
