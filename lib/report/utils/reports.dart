import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';

class ReportData {
  final List<String> keywords;
  final String summary;
  final String date;

  ReportData(
      {required this.keywords, required this.summary, required this.date});
}

SliverList renderReports(List<ReportData> reports) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final report = reports[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ReportCard(
            keywords: report.keywords,
            summary: report.summary,
            date: report.date,
          ),
        );
      },
      childCount: reports.length,
    ),
  );
}
