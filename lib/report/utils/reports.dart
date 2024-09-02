import 'package:flutter/material.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/view/s_report_detail.dart';

class ReportData {
  final List<String> keywords;
  final String summary;
  final String date;

  ReportData(
      {required this.keywords, required this.summary, required this.date});
}

SliverList renderReports({required List<Report> reports, Color? color}) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        final report = reports[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => ReportDetail()));
            },
            child: ReportCard(
              imageUrl: report.thumbnail,
              keywords: report.tags!,
              summary: report.aiSummary!,
              date: report.createdAt!,
              color: color,
            ),
          ),
        );
      },
      childCount: reports.length,
    ),
  );
}
