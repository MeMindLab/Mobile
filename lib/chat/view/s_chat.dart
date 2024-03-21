import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/component/chat_mic.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/chat/utils/show_snackbar.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/component/dots_indicator.dart';
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
  @override
  void initState() {
    super.initState();
  }

  Widget AiCommentTile(
      {CustomTheme? theme,
      String? commentContent,
      bool isAirequest = false,
      bool isStart = false,
      bool isSameGureumi = false}) {
    return Container(
      padding: isStart == true
          ? const EdgeInsets.all(0)
          : const EdgeInsets.only(top: 30),
      child: ListTile(
        minVerticalPadding: 0,
        visualDensity: VisualDensity(vertical: 2),
        leading: Container(
          constraints: BoxConstraints(
            minWidth: MediaQuery.of(context).size.width * 0.1,
            minHeight: double.infinity,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Spacer(),
              isSameGureumi == false
                  ? Image.asset(
                      'assets/image/logo/logo.png',
                      width: 50,
                      height: 50,
                      fit: BoxFit.fill,
                    )
                  : const SizedBox(
                      width: 50,
                      height: 50,
                    ),
            ],
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: theme!.appColors.userInputBackground,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(0),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(32),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.68,
              ),
              child: isAirequest == false
                  ? Text(
                      commentContent!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    )
                  : CustomDotsIndicator(),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8, top: 4),
              child: Text(
                datetimeType2(),
                style: FontSizes.getCapsuleStyle().copyWith(
                    color: theme.appColors.hintText,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget UserCommentTile({
    CustomTheme? theme,
    String? commentContent,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 30),
      child: ListTile(
        minVerticalPadding: 0,
        leading: const SizedBox(
          width: 50,
          height: 50,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              decoration: BoxDecoration(
                color: theme!.appColors.userChatBackground,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  bottomLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                  bottomRight: Radius.circular(0),
                ),
              ),
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.68,
              ),
              child: Text(
                commentContent!,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              margin: const EdgeInsets.only(right: 8, top: 4),
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    datetimeType2(),
                    style: FontSizes.getCapsuleStyle().copyWith(
                        color: theme.appColors.hintText,
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  )),
            ),
          ],
        ),
      ),
    );
  }

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
            // ShowSnackBar()
            //     .showSnackBarFunction(context, "비타민을 1개 소모했어요.", isBack: true);
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
                : SizedBox(),
            Expanded(
              child: Stack(children: [
                ListView(
                  shrinkWrap: true,
                  reverse: true,
                  children: [
                    AiCommentTile(theme: theme, isAirequest: true),
                    UserCommentTile(
                        theme: theme,
                        commentContent:
                            "여름에는 더 힘든 것 같애..\n아침부터 에어컨이 고장난거야 ㅠㅠ 출근 준비하는데 너무 더워서 땀을 뻘뻘흘렸엉.."),
                    AiCommentTile(
                        theme: theme,
                        commentContent:
                            '오늘 많이 지치고 힘들었던 날이군요ㅜㅜ어떤 일들이 힘들었는지 얘기해줄 수 있어요?'),
                    UserCommentTile(
                        theme: theme, commentContent: '오늘도 힘들었어ㅠㅠㅠ'),
                    AiCommentTile(
                        theme: theme,
                        commentContent:
                            '오늘 하루 있었던 일이나 느낀 감정은 이야기해주세요. 구르미가 모두 들어줄게요!',
                        isStart: true,
                        isSameGureumi: true),
                    AiCommentTile(
                        theme: theme,
                        commentContent: "안녕하세요. 구르미에요:)",
                        isStart: true),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
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
                      : SizedBox(),
                ),
              ]),
            ),
            _BottomInputField(theme),
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

  Widget _BottomInputField(CustomTheme theme) {
    return SafeArea(
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                // 입력창
                Container(
                  key: _containerkey,
                  constraints: BoxConstraints(minHeight: 78),
                  // height: 78,
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
                          // const Spacer(),
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
                              onChanged: (value) {
                                if (_containerkey.currentContext != null) {
                                  final RenderBox renderBox = _containerkey
                                      .currentContext!
                                      .findRenderObject() as RenderBox;
                                  Size size = renderBox.size;
                                  print(size.height);
                                }
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
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        setState(() {
                                          micWidth +=
                                              isMicOpen ? -272.1 : 272.1;
                                          isMicOpen = isMicOpen ? false : true;
                                        });
                                      },
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
                                        child: Icon(
                                          Icons.keyboard_arrow_up,
                                          color: theme.appColors.seedColor,
                                          size: 30,
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
