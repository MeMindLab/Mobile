import 'package:flutter/material.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/w_date_search_bar.dart';

class SearchFragment extends StatelessWidget {
  const SearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
        title: "리포트",
        appBarLeading: BackArrowLeading(),
        child: ReportDateSearchBar());
  }
}
