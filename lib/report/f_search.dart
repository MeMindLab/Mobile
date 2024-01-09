import 'package:flutter/material.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';

class SearchFragment extends StatelessWidget {
  const SearchFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultLayout(
      title: "리포트",
      appBarLeading: BackArrowLeading(),
      child: CustomSearchBar(),
    );
  }
}
