import 'package:flutter/material.dart';
import 'package:me_mind/common/theme/color/light_app_colors.dart';

enum DialogStatus {
  logout,
  sendresult,
}

void settingDialog(BuildContext context, DialogStatus dialogStatus) {
  final deviceWidth = MediaQuery.of(context).size.width;
  List<Widget>? logoutActions = [
    Container(
      width: 190,
      height: 41,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 238, 151, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextButton(
        child: const Text('취소', style: TextStyle(color: Colors.black)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    Container(
      width: 75,
      height: 41,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(229, 229, 229, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextButton(
        child: const Text(
          '확인',
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () {},
      ),
    ),
  ];

  List<Widget>? sendOpinion = [
    Container(
      width: deviceWidth * 0.8,
      height: 41,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(255, 238, 151, 1),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: TextButton(
        child: const Text('닫기', style: TextStyle(color: Colors.black)),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
  ];

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.fromLTRB(0, 30, 0, 15),
          actionsPadding: const EdgeInsets.fromLTRB(15, 5, 15, 15),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              dialogStatus == DialogStatus.logout
                  ? const Text(
                      "로그아웃 하시겠습니까?",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    )
                  : const Column(children: [
                      Text("의견을 성공적으로 보냈습니다!",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: 10,
                      ),
                      Text("답변은 추후 등록된 이메일로 전송됩니다.",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500))
                    ]),
            ],
          ),
          actions:
              dialogStatus == DialogStatus.logout ? logoutActions : sendOpinion,
        );
      });
}
