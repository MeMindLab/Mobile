import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/component/chat_mic.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isMicOpen = false;
  double micWidth = 61.63;
  bool isFolded = false;
  @override
  void initState() {
    super.initState();
  }

  Widget AiCommentTile(
      {CustomTheme? theme,
      String? commentContent,
      bool isSameGureumi = false}) {
    return ListTile(
      leading: Container(
        constraints: BoxConstraints(
          minWidth: MediaQuery.of(context).size.width * 0.1,
        ),
        //margin: EdgeInsets.only(left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
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
            const Spacer(),
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
    );
  }

  Widget UserCommentTile({
    CustomTheme? theme,
    String? commentContent,
  }) {
    return ListTile(
      leading: const SizedBox(
        width: 50,
        height: 50,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: double.infinity,
            // margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
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
    );
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    return SafeArea(
      child: DefaultLayout(
        backgroundColor: Colors.white,
        appBarActions: [
          Container(
            child: Row(
              children: [
                SvgPicture.asset(
                  'assets/svg/icon/report.svg',
                  width: 28,
                  height: 28,
                ),
              ],
            ),
          ),
        ],
        title: datetimeType1(),
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            // 접기 기능 포함될 알림 창
            Expanded(
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  UserCommentTile(
                      theme: theme,
                      commentContent:
                          "여름에는 더 힘든 것 같애..\n아침부터 에어컨이 고장난거야 ㅠㅠ 출근 준비하는데 너무 더워서 땀을 뻘뻘흘렸엉.."),
                  const SizedBox(
                    height: 10,
                  ),
                  AiCommentTile(
                      theme: theme,
                      commentContent:
                          '오늘 많이 지치고 힘들었던 날이군요ㅜㅜ어떤 일들이 힘들었는지 얘기해줄 수 있어요?'),
                  const SizedBox(
                    height: 10,
                  ),
                  UserCommentTile(theme: theme, commentContent: '오늘도 힘들었어ㅠㅠㅠ'),
                  const SizedBox(
                    height: 10,
                  ),
                  AiCommentTile(
                      theme: theme,
                      commentContent:
                          '오늘 하루 있었던 일이나 느낀 감정은 이야기해주세요. 구르미가 모두 들어줄게요!',
                      isSameGureumi: true),
                  AiCommentTile(theme: theme, commentContent: "안녕하세요. 구르미에요:)"),
                  ChatNotification(
                      theme: theme,
                      isFolded: isFolded,
                      onPressed: () {
                        setState(() {
                          isFolded = !isFolded;
                        });
                      }),
                ],
              ),
            ),
            _BottomInputField(theme),
          ],
        ),
        appBarLeading: const BackArrowLeading(),
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
                  height: 78,
                  padding: const EdgeInsets.only(top: 19, bottom: 19),
                  decoration: BoxDecoration(
                    color: theme.appColors.userInputBackground,
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 6, 0),
                        child: SvgPicture.asset(
                            'assets/svg/icon/imageUpload.svg',
                            width: 30,
                            height: 30,
                            colorFilter: ColorFilter.mode(
                                theme.appColors.activate, BlendMode.srcIn)),
                      ),
                      Expanded(
                        child: Container(
                          height: 40,
                          margin: const EdgeInsets.only(right: 20),
                          child: TextField(
                            maxLines: 1,
                            showCursor: true,
                            cursorWidth: 1,
                            cursorColor: Colors.black,
                            style: FontSizes.getCapsuleStyle().copyWith(
                                color: theme.appColors.iconButton,
                                fontSize: 14),
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: const EdgeInsets.only(left: 20),
                              filled: true,
                              fillColor: theme.appColors.seedColor,
                              // textfield 오른쪽에 아이콘
                              suffixIcon: SizedBox(
                                width: 72,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          FocusScope.of(context).unfocus();
                                          setState(() {
                                            micWidth +=
                                                isMicOpen ? -272.1 : 272.1;
                                            isMicOpen =
                                                isMicOpen ? false : true;
                                          });
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.fromLTRB(
                                              0, 5, 10, 5),
                                          child: SvgPicture.asset(
                                              'assets/svg/icon/mic.svg',
                                              colorFilter: ColorFilter.mode(
                                                  theme.appColors.activate,
                                                  BlendMode.srcIn)),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
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
                              labelStyle:
                                  TextStyle(color: theme.appColors.activate),
                              focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    width: 1, color: theme.appColors.seedColor),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    width: 1, color: theme.appColors.seedColor),
                              ),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                                borderSide: BorderSide(
                                    width: 1, color: theme.appColors.seedColor),
                              ),
                            ),
                            keyboardType: TextInputType.multiline,
                          ),
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
