import 'package:flutter/cupertino.dart';

// 인증완료, 미인증 컴포넌트
class CertifiedBox extends StatelessWidget {
  bool certi;
  CertifiedBox({
    Key? key,
    required this.certi,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (certi == false) {
      return Container(
        width: 52,
        height: 21,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(204, 204, 204, 1)),
        child: const Center(
            child: Text(
          "미인증",
          style: TextStyle(fontSize: 12),
        )),
      );
    } else {
      return Container(
        width: 65,
        height: 21,
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromRGBO(255, 238, 151, 1)),
        child: const Center(
            child: Text(
          "인증완료",
          style: TextStyle(fontSize: 12),
        )),
      );
    }
  }
}
