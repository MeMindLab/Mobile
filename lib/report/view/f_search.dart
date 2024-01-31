import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
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

  bool isSearched = false;
  bool isNull = false;
  List<ReportData> searchResult = [];

  void handleSearch() async {
    var result = await SearchService().search(controller.text);
    setState(() {
      isNull = false;
    });
    if (result != null) {
      setState(() {
        searchResult = result;
      });
    } else {
      setState(() {
        isNull = true;
      });
    }
  }

  VoidCallback? onSearchSubmitted() {
    handleSearch();
    setState(() {
      isSearched = true;
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
          isSearched == false
              ? const SizedBox()
              : isNull == false
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
