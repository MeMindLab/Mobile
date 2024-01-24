import 'package:flutter/material.dart';

import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/f_report_month.dart';

class ReportMonth extends StatefulWidget {
  const ReportMonth({super.key});

  @override
  State<ReportMonth> createState() => _ReportMonthState();
}

class _ReportMonthState extends State<ReportMonth> {
  @override
  Widget build(BuildContext context) {
    List<ReportData> reports = [
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
    ];

    DateTime now = DateTime.now();
    String defaultDateTime =
        '${now.year}.${now.month.toString().padLeft(2, '0')}';

    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      child: ReportMonthFragment(
        reports: reports,
        datetime: defaultDateTime,
      ),
    );
  }
}
