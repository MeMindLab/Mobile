import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/layout/default_layout.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isMicOpen = false;
  double micWidth = 61.63;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultLayout(
        appBarActions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: Row(
              children: [
                SvgPicture.asset('assets/svg/icon/report.svg'),
              ],
            ),
          ),
        ],
        title: datetimeType1(),
        child: Column(
          children: [
            Container(
              height: 77,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Color(0xff2C3642)),
                color: Color(0xff2C3642),
              ),
              margin: EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('쓸봇은 미마인드가 개발한 ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('일기쓰기 전문 인공지능 ', style: TextStyle(color: Colors.lightBlue, fontSize: 14, fontWeight: FontWeight.w400)),
                      Text('입니다.', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                    ],
                  ),
                  Text('쓸봇과 함께 텍스트와 음성으로 편리하게 일기를 남겨보세요!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width * 0.1,
                          ),
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/svg/icon/robot.svg'),
                              Text('쓸봇AI'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
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
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(datetimeType2()),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width * 0.1,
                          ),
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                              SvgPicture.asset('assets/svg/icon/robot.svg'),
                              Text('쓸봇AI'),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
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
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(datetimeType2()),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width * 0.2,
                          ),
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            children: [
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(10, 30, 0, 0),
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
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(datetimeType2()),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        appBarLeading: Icon(Icons.keyboard_backspace),
        bottomSheet: Container(
          width: double.infinity,
          height: micWidth,
          child: Column(
            children: [
              Container(
                height: 61.63,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 10, 10),
                      child: SvgPicture.asset('assets/svg/icon/imageUpload.svg',
                          colorFilter: ColorFilter.mode(
                              Colors.white, BlendMode.srcIn)),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 155,
                      height: 40,
                      child: TextField(
                        cursorWidth: 0,
                        style: TextStyle(fontSize: 12),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xff999999),
                          labelText: '',
                          hintText: '',
                          labelStyle: TextStyle(color: Color(0xff999999)),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            borderSide: BorderSide(width: 1, color: Color(0xff999999)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            borderSide: BorderSide(width: 1, color: Color(0xff999999)),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          micWidth += isMicOpen ? -272.1 : 272.1;
                          isMicOpen = isMicOpen ? false : true;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        child: SvgPicture.asset('assets/svg/icon/mic.svg',
                            colorFilter: ColorFilter.mode(
                                Colors.white, BlendMode.srcIn)),
                      ),
                    ),
                    SvgPicture.asset('assets/svg/icon/circleUp.svg',
                        colorFilter: ColorFilter.mode(
                            Color(0xff959CD6), BlendMode.srcIn)),
                  ],
                ),
              ),
              if (isMicOpen == true)...[
                Container(
                  width: double.infinity,
                  height: 272.1,
                  color: Color(0xff595E66),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/chat/micBg1.svg', width: 300),
                        Positioned(
                          child: SvgPicture.asset('assets/svg/icon/mic.svg', width: 40),
                        ),
                        Positioned(
                          bottom: 20,
                          child: Text(
                            '마이크를 입에 가깝게 위치하고 말씀해주세요.\n화면을 터치하면 음성인식이 중단됩니다.',
                            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16, color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ],
          )
        ),
      ),
    );
  }
}
