import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/component/chat_message_tile.dart';
import 'package:me_mind/chat/component/chat_mic.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/screen/main/s_main.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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

  List<ChatMessageModel> chatHistory = [
    {
      "message": "안녕하세요. 구르미에요 :)",
      "index": 1,
      "is_ai": true,
      "is_image": false
    },
    {
      "message": "오늘 하루 있었던 일이나 느낀 감정을 이야기해주세요.구르미가 모두 들어줄게요!",
      "index": 1,
      "is_ai": true,
      "is_image": false
    },
    {"message": "오늘도 힘들었어ㅠㅠㅠ", "index": 2, "is_ai": false, "is_image": false},
    {
      "message": "오늘 많이 지치고 힘들었던 날이군요ㅠㅠ 어떤 일들이 힘들었는지 얘기해줄 수 있어요?",
      "index": 3,
      "is_ai": true,
      "is_image": false
    },
    {
      "message":
          "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
      "index": 4,
      "is_ai": false,
      "is_image": true
    },
    {
      "message": "오늘 많이 지치고 힘들었던 날이군요ㅠㅠ 어떤 일들이 힘들었는지 얘기해줄 수 있어요?",
      "index": 5,
      "is_ai": true,
      "is_image": false
    },
  ].reversed.map((e) => ChatMessageModel.fromJson(e)).toList();
  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return DefaultLayout(
      backgroundColor: Colors.white,
      appBarActions: [
        InkWell(
          onTap: () {
            setState(() {
              isReportIssue = true;
            });
            ShowSnackBar()
                .showSnackBarFunction(context, "리포트를 생성 중입니다.창을 닫지말고 기다려주세요.");
            setState(() {
              isReportIssue = false;
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
                    return Padding(
                      padding: index == chatHistory.length - 1
                          ? EdgeInsets.zero
                          : index == 0
                              ? const EdgeInsets.only(bottom: 10)
                              : const EdgeInsets.only(bottom: 30.0),
                      child: Center(
                        child: ChatMessageTile.fromModel(chatHistory[index],
                            chatHistory[index] == 1 ? true : null),
                      ),
                    );
                  },
                  itemCount: chatHistory.length,
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
                                          onTap: () {
                                            if (chatContent != "") {
                                              final newChatHistory = [
                                                ...chatHistory
                                              ];
                                              newChatHistory.insert(
                                                  0,
                                                  ChatMessageModel(
                                                      message: chatContent,
                                                      index: 10,
                                                      is_ai: false,
                                                      is_image: false));

                                              setState(() {
                                                chatHistory = newChatHistory;
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
