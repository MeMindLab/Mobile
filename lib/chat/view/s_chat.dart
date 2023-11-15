import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/component/root_tab.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
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

                  ],
                )
              ),
            ),
          ],
        ),
        appBarLeading: Icon(Icons.keyboard_backspace),
        bottomSheet: Container(
          width: double.infinity,
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
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: SvgPicture.asset('assets/svg/icon/mic.svg',
                    colorFilter: ColorFilter.mode(
                        Colors.white, BlendMode.srcIn)),
              ),
              SvgPicture.asset('assets/svg/icon/circleUp.svg',
                  colorFilter: ColorFilter.mode(
                      Color(0xff959CD6), BlendMode.srcIn)),
            ],
          ),
        ),
      ),
    );
  }
}
