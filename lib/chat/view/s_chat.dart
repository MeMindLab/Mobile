import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/chat/component/chat_notification.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/layout/default_layout.dart';
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
          children: [
            isSameGureumi == false
                ? SvgPicture.asset(
                    'assets/svg/icon/robot.svg',
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
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
              maxWidth: MediaQuery.of(context).size.width * 0.7,
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
            margin: const EdgeInsets.only(left: 10),
            child: Text(
              datetimeType2(),
              style: TextStyle(color: theme.appColors.hintText),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xffA9D0FF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                bottomLeft: Radius.circular(32),
                topRight: Radius.circular(32),
                bottomRight: Radius.circular(0),
              ),
            ),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            child: Text(
              commentContent!,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  datetimeType2(),
                  style: TextStyle(color: theme!.appColors.hintText),
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
        backgroundColor: theme.appColors.seedColor,
        appBarActions: [
          Container(
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/icon/report.svg'),
              ],
            ),
          ),
        ],
        title: datetimeType1(),
        // ignore: sort_child_properties_last
        child: Column(
          children: [
            // 접기 기능 포함될 알림 창
            ChatNotification(
                theme: theme,
                isFolded: isFolded,
                onPressed: () {
                  setState(() {
                    isFolded = !isFolded;
                  });
                }),
            Expanded(
              child: ListView(
                shrinkWrap: true,
                reverse: true,
                children: [
                  UserCommentTile(
                      theme: theme,
                      commentContent:
                          "여름에는 더 힘든 것 같애..\n아침부터 일복이 터졌엉 어제 할일도 다 못했는데 팀장님이 보고서 다시 정리하라고 회의할 때 나만 콕 집어서 지시해;;\n짜증나 죽는줄 알았네...왜 나한테만 일을 몰아주는거지? 이대리님도 있고, 동기인 박매니저도 있는데..."),
                  AiCommentTile(
                      theme: theme,
                      commentContent:
                          '더운 날씨에 정말 속상했을 것 같아요. 상사의 부당한 지시는 어디에 하소연 할 곳도 없고 힘드셨을 것 같아요.'),
                  UserCommentTile(theme: theme, commentContent: '오늘도 힘들었어ㅠㅠㅠ'),
                  AiCommentTile(
                      theme: theme,
                      commentContent:
                          '오늘 하루 있었던 일이나 느낀 감정은 이야기해주세요. 구르미가 모두 들어줄게요!',
                      isSameGureumi: true),
                  AiCommentTile(theme: theme, commentContent: "안녕하세요. 구르미에요:)"),
                ],
              ),
            ),
            _BottomInputField(theme),
          ],
        ),
        appBarLeading: Icon(Icons.keyboard_backspace),
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
            height: micWidth,
            child: Column(
              children: [
                // 입력창
                Container(
                  decoration: BoxDecoration(
                    color: theme.appColors.userInputBackground,
                  ),
                  height: 61.63,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
                        child: SvgPicture.asset(
                            'assets/svg/icon/imageUpload.svg',
                            colorFilter: ColorFilter.mode(
                                theme.appColors.activate, BlendMode.srcIn)),
                      ),
                      Expanded(
                        child: Container(
                          //width: MediaQuery.of(context).size.width * 0.8,
                          height: 40,
                          margin: const EdgeInsets.only(right: 20),
                          child: TextField(
                            cursorWidth: 0,
                            style: TextStyle(fontSize: 12),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: theme.appColors.seedColor,
                              labelText: '',
                              hintText: '',
                              // textfield 오른쪽에 아이콘
                              suffixIcon: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
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
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 10, 10),
                                        child: SvgPicture.asset(
                                            'assets/svg/icon/mic.svg',
                                            colorFilter: ColorFilter.mode(
                                                theme.appColors.activate,
                                                BlendMode.srcIn)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5),
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
                                      // child: SvgPicture.asset(
                                      //     'assets/svg/icon/circleUp.svg',
                                      //     colorFilter: ColorFilter.mode(
                                      //       theme.appColors.activate,
                                      //       BlendMode.srcIn,
                                      //     )),
                                    ),
                                  ]),
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
                  Container(
                      width: double.infinity,
                      height: 272.1,
                      color: Color(0xff595E66),
                      child: Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/svg/chat/micBg1.svg',
                                width: 300),
                            Positioned(
                              child: SvgPicture.asset('assets/svg/icon/mic.svg',
                                  width: 40),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Text(
                                '마이크를 입에 가깝게 위치하고 말씀해주세요.\n화면을 터치하면 음성인식이 중단됩니다.',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              ],
            )),
      ),
    );
  }
}
