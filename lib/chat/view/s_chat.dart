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
import 'package:me_mind/chat/provider/chat_provider.dart';
import 'package:me_mind/chat/services/image_picker_service.dart';
import 'package:me_mind/chat/services/image_upload_service.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/component/dialog/custom_dialog.dart';
import 'package:me_mind/common/component/dialog/w_dialog_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';
import 'package:me_mind/screen/main/s_main.dart';

class Chat extends ConsumerStatefulWidget {
  const Chat({super.key});

  @override
  ConsumerState<Chat> createState() => _ChatState();
}

class _ChatState extends ConsumerState<Chat> {
  final GlobalKey _containerkey = GlobalKey();
  bool isMicOpen = false;
  double micWidth = 61.63;
  bool isFolded = false;
  bool isReportIssue = false;
  double prefixHeight = 40;
  String chatContent = "";
  TextEditingController controller = TextEditingController();
  String dateFormatted = "";

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
    final state = ref.watch(chatStateNotifierProvider);
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
      backgroundColor: Colors.white,
      appBarActions: [
        InkWell(
          onTap: () async {
            DialogManager(context: context, type: DialogType.lemon).show(
                titleText: "꿀팁을 드릴께요!",
                contentText: "비타민이 있으면 리포트 발행이 가능해요.\n번호인증하고 비타민 5개를 받아볼까요?",
                firstButtonText: "아니오",
                firstSubmit: () {
                  Navigator.pop(context);
                },
                secondButtonText: "네",
                secondSubmit: () {});
            setState(() {
              isReportIssue = true;
            });
            ShowSnackBar().showSnackBarFunction(context);
            Future.delayed(const Duration(seconds: 5), () {
              setState(() {
                isReportIssue = false;
              });
            });
          },
          child: SizedBox(
            child: Row(
              children: [
                isReportIssue == false
                    ? Image.asset(
                        "assets/image/report/report_off.png",
                        width: 28,
                        height: 28,
                      )
                    : Image.asset(
                        "assets/image/report/report_on.png",
                        width: 28,
                        height: 28,
                      )
              ],
            ),
          ),
        ),
      ],
      title: datetimeType1(),
      // ignore: sort_child_properties_last
      child: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(children: [
                ListView.builder(
                  reverse: true,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: isFolded == false
                      ? ChatNotification(
                          theme: theme,
                          isFolded: isFolded,
                          bgColor: Colors.white,
                          content:
                              '구르미는 미아인드가 개발한 일기쓰기 전문 인공지능입니다. 텍스트나 음성으로 대화하듯이 하루를 정리해보세요!',
                          onPressed: () {
                            setState(() {
                              isFolded = !isFolded;
                            });
                          })
                      : const SizedBox(),
                ),
              ]),
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
                              onTap: () async {
                                var result = await ImagePickerService(
                                        imagePicker: ImagePicker())
                                    .getImage(ImageSource.gallery);

                                if (result is! File) return;

                                var imageUpload =
                                    await ImageUploadService().upload(result);
                                if (imageUpload is! ImageUploadModel) return;
                                ref
                                    .read(chatStateNotifierProvider.notifier)
                                    .addChating(
                                        message: imageUpload.imageUrl,
                                        isImage: true);
                              },
                              child: SvgPicture.asset(
                                  'assets/svg/icon/imageUpload.svg',
                                  width: 30,
                                  height: 30,
                                  colorFilter: const ColorFilter.mode(
                                      AppColors.blue7, BlendMode.srcIn)),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
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
                              cursorColor: Colors.black,
                              style: FontSizes.getCapsuleStyle().copyWith(
                                  color: theme.appColors.iconButton,
                                  fontSize: 14),
                              decoration: InputDecoration(
                                isDense: false,
                                contentPadding:
                                    const EdgeInsets.only(left: 20, right: 80),
                                filled: true,
                                fillColor: theme.appColors.seedColor,
                                labelStyle:
                                    TextStyle(color: theme.appColors.activate),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(23)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: theme.appColors.seedColor),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(23)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: theme.appColors.seedColor),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(23)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: theme.appColors.seedColor),
                                ),
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
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(
                                            0, 5, 10, 10),
                                        child: SvgPicture.asset(
                                            'assets/svg/icon/mic.svg',
                                            colorFilter: const ColorFilter.mode(
                                                AppColors.blue7,
                                                BlendMode.srcIn)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 8, bottom: 10),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: AppColors.blue7),
                                        child: InkWell(
                                          onTap: () async {
                                            if (chatContent != "") {
                                              ref
                                                  .read(
                                                      chatStateNotifierProvider
                                                          .notifier)
                                                  .addChating(
                                                      message: chatContent);
                                              setState(() {
                                                chatContent = "";
                                              });

                                              controller.clear();
                                            }
                                          },
                                          child: Icon(
                                            Icons.keyboard_arrow_up,
                                            color: theme.appColors.seedColor,
                                            size: 30,
                                          ),
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
