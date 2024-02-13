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
  bool isResultNull = false;
  List<Report> searchResult = [];

  void handleSearch() async {
    var result = await SearchService().search(controller.text);

    setState(() {
      isResultNull = false;
    });
    if (result != null) {
      setState(() {
        searchResult = result;
      });
    } else {
      setState(() {
        isResultNull = true;
      });
    }
  }

  VoidCallback? onSearchSubmitted() {
    handleSearch();
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
              : isResultNull == false
                  ? Expanded(
                      child: CustomScrollView(
                          slivers: [renderReports(searchResult)]))
                  : const Expanded(
                      child: Column(children: [
                        SizedBox(
                          height: 241,
                        ),
                        Text("검색결과가 존재하지 않습니다."),
                      ]),
                    ),
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
