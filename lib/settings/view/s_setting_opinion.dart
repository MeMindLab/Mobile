import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';

class SettingOpinion extends StatefulWidget {
  const SettingOpinion({super.key});

  @override
  State<SettingOpinion> createState() => _SettingOpinionState();
}

class _SettingOpinionState extends State<SettingOpinion> {
  bool infoCheck = false;
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: "의견보내기",
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBarActions: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: const Row(
            children: [
              Text('10',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
      appBarLeading: IconButton(
        onPressed: () async {
          await setBottomIdx(1);
          Navigator.pop(context);
          // Navigator.pushReplacement(
          //     context,
          //     PageRouteBuilder(
          //       pageBuilder: ((BuildContext context,
          //               Animation<double> animation1,
          //               Animation<double> animation2) =>
          //           const ReportDetailScreen()),
          //       transitionDuration: Duration.zero,
          //       reverseTransitionDuration: Duration.zero,
          //     ));
        },
        icon: const Icon(Icons.arrow_back),
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(224, 230, 246, 1),
              borderRadius: BorderRadius.circular(13),
            ),
            child: const Text(
              "memind를 이용하며 생긴 궁금한 점이나, 관련하여 전달하고픈 피드백을 넘겨주세요.",
              style: TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "제목",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SeetingCustomTextFormField(
              hintText: "제목을 입력해주세요",
              onChanged: (String? value) {},
              bgColor: Color.fromRGBO(241, 243, 248, 1)),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "내용",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SeetingCustomTextFormField(
              hintText: "내용을 입력해주세요",
              maxLines: 8,
              onChanged: (String? value) {},
              bgColor: Color.fromRGBO(241, 243, 248, 1)),
          const SizedBox(
            height: 10,
          ),
          // 사진 추가하는 부분
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(0),
            child: GridView.count(
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              crossAxisCount: 4,
              children: [
                Container(
                  width: 85,
                  height: 85,
                  decoration: const BoxDecoration(
                      color: Color.fromRGBO(241, 243, 248, 1)),
                  child: const Center(
                      child: Icon(
                    Icons.add,
                    color: Colors.grey,
                    size: 35,
                  )),
                ),
              ],
            ),
          ),
          const Expanded(
            child: SizedBox(),
          ),
          // 수집 안내문
          SizedBox(
            width: double.infinity,
            child: Row(children: [
              InkWell(
                onTap: () {
                  setState(() {
                    infoCheck = !infoCheck;
                  });
                },
                child: SizedBox(
                  height: 50,
                  child: infoCheck == false
                      ? SvgPicture.asset('assets/svg/icon/check.svg',
                          width: 16, height: 16)
                      : SvgPicture.asset('assets/svg/icon/check.svg',
                          colorFilter: const ColorFilter.mode(
                              Color.fromRGBO(47, 140, 250, 1), BlendMode.srcIn),
                          width: 16,
                          height: 16),
                ),
              ),
              Flexible(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: const Text(
                    "수집된 정보는 의견에 대한 답변 목적으로 활용되며, 의견을 보내시면 정보 수집에 동의하게 됩니다"),
              ))
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
            onPressed: () {},
            text: "의견 보내기",
          )
        ]),
      ),
    );
  }
}
