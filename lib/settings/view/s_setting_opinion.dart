import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:me_mind/common/component/custom_dialog.dart';
import 'package:me_mind/common/component/rounded_button.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/settings/component/settings_custom_text_form.dart';
import 'package:me_mind/settings/repositories/imageRepository.dart';

class SettingOpinion extends StatefulWidget {
  const SettingOpinion({super.key});

  @override
  State<SettingOpinion> createState() => _SettingOpinionState();
}

class _SettingOpinionState extends State<SettingOpinion> {
  bool infoCheck = false;
  List opinionList = [];

  setOpinionList(value) async {
    if (value != null) {
      setState(() {
        opinionList.add(value);
      });
    }
  }

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
              style: TextStyle(fontSize: 16, color: AppColors.blue8),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "제목",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue8),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
            child: SeetingCustomTextFormField(
                hintText: "제목을 입력해주세요",
                onChanged: (String? value) {},
                bgColor: Color.fromRGBO(241, 243, 248, 1)),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "내용",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blue8),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(13)),
            child: SeetingCustomTextFormField(
                hintText: "내용을 입력해주세요",
                maxLines: 8,
                onChanged: (String? value) {},
                bgColor: Color.fromRGBO(241, 243, 248, 1)),
          ),
          const SizedBox(
            height: 10,
          ),
          // 사진 추가하는 부분
          Container(
            alignment: Alignment.topLeft,
            width: double.infinity,
            height: 100,
            padding: const EdgeInsets.all(0),
            // 0번째 idx는 사진 추가하는 버튼, 1부터 추가한 사진
            child: GridView.builder(
                itemCount: opinionList.length + 1,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10, //수평 Padding
                  crossAxisSpacing: 10, //수직 Padding
                ),
                itemBuilder: (_, int idx) {
                  if (idx == 0) {
                    return InkWell(
                      // 사진 추가 함수
                      onTap: () async {
                        XFile? result = await ImagePickerRepository(
                                imagePicker: ImagePicker())
                            .getImage(ImageSource.gallery);
                        if (result != null) {
                          await setOpinionList(result);
                        }
                      },
                      child: Container(
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
                    );
                  } else {
                    return Container(
                      width: 85,
                      height: 85,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: FileImage(File(opinionList[idx - 1].path)),
                              fit: BoxFit.cover)),
                      child: Center(child: Text("${idx - 1}")),
                    );
                  }
                }),
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
                  "수집된 정보는 의견에 대한 답변 목적으로 활용되며, 의견을 보내시면 정보 수집에 동의하게 됩니다",
                  style: TextStyle(color: AppColors.blue8),
                ),
              ))
            ]),
          ),
          const SizedBox(
            height: 10,
          ),
          RoundedButton(
            onPressed: () => getCustomDialog(context,
                buttonText: "닫기",
                contentTitleText: "의견을 성공적으로 보냈습니다!",
                contentdetailText: "답변은 추후 등록한 이메일로 전송됩니다."),
            text: "의견 보내기",
          )
        ]),
      ),
    );
  }
}
