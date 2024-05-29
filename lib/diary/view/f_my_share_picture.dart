import 'package:flutter/material.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/diary/component/diary_picture.dart';
import 'package:me_mind/diary/view/s_my_share_picture.dart';

class MySharePictureFragment extends StatefulWidget {
  const MySharePictureFragment({super.key});

  @override
  State<MySharePictureFragment> createState() => _MySharePictureFragmentState();
}

class _MySharePictureFragmentState extends State<MySharePictureFragment> {
  List<String> mySharePictures = [
    "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
    "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
    "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
    "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 17.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "나의 공유 그림",
                style: FontSizes.getHeadline1Style()
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => MySharePictureScreen()));
                },
                child: Text(
                  "전체 보기",
                  style: FontSizes.getContentStyle()
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 20),
          height: 124,
          width: double.infinity,
          child: mySharePictures.length == 0
              ? Center(
                  child: Text("공유된 그림이 없습니다."),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (_, idx) => Padding(
                    padding: EdgeInsets.only(
                        right: idx == mySharePictures.length - 1 ? 20.0 : 8.0),
                    child: DiaryPicture(
                      pictureUrl: mySharePictures[idx],
                    ),
                  ),
                  itemCount: mySharePictures.length,
                  scrollDirection: Axis.horizontal,
                ),
        ),
        const SizedBox(
          height: 26,
        )
      ],
    );
  }
}
