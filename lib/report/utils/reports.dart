import 'package:flutter/material.dart';
import 'package:me_mind/report/component/report_card.dart';

class ReportData {
  final List<String> tags;
  final String ai_summary;
  final String date;

  ReportData(
      {required this.tags, required this.ai_summary, required this.date});
}

SliverList renderReports(List<ReportData> reports) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final report = reports[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ReportCard(
            tags: report.tags,
            summary: report.ai_summary,
            date: report.date,
          ),
        );
      },
      childCount: reports.length,
    ),
  );
}
