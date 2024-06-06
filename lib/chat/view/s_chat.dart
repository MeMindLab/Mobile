import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/component/chat_message_tile.dart';
import 'package:me_mind/chat/component/chat_mic.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/provider/chat_provider.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
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
                SvgPicture.asset('assets/svg/icon/report.svg',
                    width: 28,
                    height: 28,
                    colorFilter: ColorFilter.mode(
                        isReportIssue == false ? Colors.grey : Colors.blue,
                        BlendMode.srcIn)),
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
            isFolded == true
                ? InkWell(
                    onTap: () {
                      setState(() {
                        isFolded = false;
                      });
                    },
                    child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: SvgPicture.asset(
                            "assets/svg/chat/arrow_down.svg",
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
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
                      );
                    } else if (state[index] is ChatMessageError) {
                      return const ChatMessageTile(
                        message: "다시 한번 입력해주세요",
                        isAi: true,
                        isImage: false,
                      );
                    } else {
                      return Padding(
                        padding: index == 0
                            ? EdgeInsets.zero
                            : index == state.length - 1
                                ? const EdgeInsets.only(bottom: 10)
                                : const EdgeInsets.only(bottom: 30.0),
                        child: Center(
                          child: ChatMessageTile.fromModel(
                              state[index], state[index] == 1 ? true : null),
                        ),
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
                            margin: const EdgeInsets.fromLTRB(20, 0, 6, 10),
                            child: SvgPicture.asset(
                                'assets/svg/icon/imageUpload.svg',
                                width: 30,
                                height: 30,
                                colorFilter: ColorFilter.mode(
                                    theme.appColors.activate, BlendMode.srcIn)),
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
                                            colorFilter: ColorFilter.mode(
                                                theme.appColors.activate,
                                                BlendMode.srcIn)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5, bottom: 10),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: theme.appColors.activate),
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
