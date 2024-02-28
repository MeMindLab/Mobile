import 'package:flutter/material.dart';
import 'package:me_mind/common/component/root_tab.dart';

import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/view/f_search.dart';

class ReportSearch extends StatefulWidget {
  const ReportSearch({super.key});

  @override
  State<ReportSearch> createState() => _ReportSearchState();
}

class _ReportSearchState extends State<ReportSearch> {
  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: "리포트",
      bottomNavigationBar: RootTab(),
      appBarLeading: BackArrowLeading(),
      child: SearchFragment(),
    );
  }
}
