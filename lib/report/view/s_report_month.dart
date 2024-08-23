import 'package:flutter/material.dart';
import 'package:me_mind/common/component/root_tab.dart';

import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/model/report_month/report_month_model.dart';
import 'package:me_mind/report/services/report_monthly_service.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/f_report_month.dart';
import 'package:intl/intl.dart';

class ReportMonth extends StatefulWidget {
  final DateTime selectedDate;

  const ReportMonth({super.key, required this.selectedDate});

  @override
  State<ReportMonth> createState() => _ReportMonthState();
}

class _ReportMonthState extends State<ReportMonth> {
  late DateTime reportDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      reportDate = widget.selectedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    // List<ReportData> reports = [
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    //   ReportData(
    //     keywords: ["키워드1", "키워드2"],
    //     summary:
    //         "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
    //     date: '2023.10.31',
    //   ),
    // ];

    // DateTime now = DateTime.now();
    // String defaultDateTime =
    //     '${now.year}.${now.month.toString().padLeft(2, '0')}';
    String defaultDateTime = DateFormat("yyyy.MM").format(reportDate);
    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: Center(
        child: FutureBuilder(
            future: ReportMonthlyService().getReports(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // 작업이 진행 중일 때 로딩 스피너를 표시
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // 작업이 실패했을 때 에러 메시지 표시
                return Text("Error: ${snapshot.error}");
              } else if (snapshot.hasData) {
                // 작업이 성공적으로 완료되었을 때 데이터를 표시
                final result = snapshot.data as ReportMonthModel;
                return ReportMonthFragment(
                  reports: result.reports,
                  datetime: defaultDateTime,
                );
              } else {
                // 기본적으로 데이터가 없을 때의 상태 처리
                return Text("No data");
              }
            }),
      ),
    );
  }
}
