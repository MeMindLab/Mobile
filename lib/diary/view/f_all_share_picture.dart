import 'package:flutter/material.dart';
import 'package:me_mind/diary/utils/share_pictures.dart';

class AllSharePictureFragment extends StatefulWidget {
  const AllSharePictureFragment({super.key});

  @override
  State<AllSharePictureFragment> createState() =>
      _AllSharePictureFragmentState();
}

class _AllSharePictureFragmentState extends State<AllSharePictureFragment> {
  List<DiaryData> data = [
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
    DiaryData(
        image:
            "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        title: "뚜벅뚜벅 출근길",
        heart: "25",
        date: "2024-01-25"),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Expanded(
            child: CustomScrollView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                slivers: [
                  renderDiaries(data: data),
                ]),
          ),
        ],
      ),
    );
  }
}
