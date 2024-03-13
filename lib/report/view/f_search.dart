import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';
import 'package:me_mind/report/services/search_service.dart';
import 'package:me_mind/report/utils/reports.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({
    super.key,
  });

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  final controller = TextEditingController();

  bool isKeywordSearched = false;

  VoidCallback? onSearchSubmitted() {
    setState(() {
      isKeywordSearched = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSearchBar(
            controller: controller,
            onSubmitted: onSearchSubmitted,
          ),
          const SizedBox(
            height: 29,
          ),
          isKeywordSearched == false
              ? const SizedBox()
              : controller.text == "배고픔"
                  ? const Column(children: [
                      SizedBox(
                        height: 241,
                      ),
                      Text("검색결과가 존재하지 않습니다."),
                    ])
                  : FutureBuilder(
                      future: SearchService().search(controller.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data != null) {
                            List<ReportData> newReports = [];
                            for (var i = 0; i < snapshot.data.length; i++) {
                              Report newReport = snapshot.data[i];

                              newReports.add(ReportData(
                                  keywords: newReport.tags,
                                  summary: newReport.aiSummary,
                                  date: DateFormat("yyyy.MM.dd").format(
                                      DateTime.parse(newReport.createdAt))));
                            }
                            return Expanded(
                                child: CustomScrollView(slivers: [
                              renderReports(reports: newReports)
                            ]));
                          }
                        }
                        if (snapshot.hasError) {
                          return const Expanded(
                            child: Column(children: [
                              SizedBox(
                                height: 241,
                              ),
                              Text("검색결과가 존재하지 않습니다."),
                            ]),
                          );
                        }
                        return const SizedBox();
                      })
        ],
      ),
    );
  }
}
