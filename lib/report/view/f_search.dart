import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/report/component/report_card.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';
import 'package:me_mind/report/services/search_service.dart';

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
              : FutureBuilder(
                  future: SearchService().search(controller.text),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == null) {
                        return const Expanded(
                          child: Column(children: [
                            SizedBox(
                              height: 241,
                            ),
                            Text("검색결과가 존재하지 않습니다."),
                          ]),
                        );
                      } else {
                        return Expanded(
                            child: CustomScrollView(
                                slivers: [renderReports(snapshot.data)]));
                      }
                    } else {
                      return const SizedBox();
                    }
                  })
        ],
      ),
    );
  }
}

SliverList renderReports(List<Report> reports) {
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        Report report = reports[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: ReportCard(
            keywords: report.tags,
            summary: report.aiSummary,
            date: DateFormat("yyyy.MM.dd")
                .format(DateTime.parse(report.createdAt)),
          ),
        );
      },
      childCount: reports.length,
    ),
  );
}
