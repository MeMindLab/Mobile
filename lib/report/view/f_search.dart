import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/f_report_month.dart';

class SearchFragment extends StatefulWidget {
  const SearchFragment({
    super.key,
  });

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends State<SearchFragment> {
  List<ReportData> temp = [];
  List<ReportData> reports = [
    ReportData(
      keywords: ["키워드1", "키워드2"],
      summary:
          "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
      date: '2023.10.31',
    ),
  ];

  VoidCallback? onSearchSubmitted() {
    setState(() {
      temp = reports;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSearchBar(
            onSubmitted: onSearchSubmitted,
          ),
          const SizedBox(
            height: 29,
          ),
          Expanded(child: CustomScrollView(slivers: [renderReports(temp)])),
        ],
      ),
    );
  }
}
