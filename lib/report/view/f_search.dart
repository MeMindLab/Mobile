import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/view/f_report_month.dart';

class SearchFragment extends StatelessWidget {
  const SearchFragment({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSearchBar(),
        ],
      ),
    );
  }
}
