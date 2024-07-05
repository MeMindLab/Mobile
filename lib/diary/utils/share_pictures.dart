import 'package:flutter/material.dart';
import 'package:me_mind/diary/component/diary_card.dart';

class DiaryData {
  final String image;
  final String title;
  final String heart;
  final String date;
  DiaryData({
    required this.image,
    required this.title,
    required this.heart,
    required this.date,
  });
}

SliverList renderDiaries({required List<DiaryData> data}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final diary = data[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 25.0),
          child: InkWell(
              onTap: () {},
              child: DiaryCard(
                  diaryDate: diary.date,
                  diaryImage: diary.image,
                  diaryTitle: diary.title,
                  heartCount: diary.heart)),
        );
      },
      childCount: data.length,
    ),
  );
}
