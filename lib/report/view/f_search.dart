import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:me_mind/common/component/custom_search_bar.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/provider/report_search_provider.dart';

import 'package:me_mind/report/utils/reports.dart';

class SearchFragment extends ConsumerStatefulWidget {
  const SearchFragment({
    super.key,
  });

  @override
  ConsumerState<SearchFragment> createState() => _SearchFragmentState();
}

class _SearchFragmentState extends ConsumerState<SearchFragment> {
  final controller = TextEditingController();

  bool isKeywordSearched = false;

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    final reports = ref.watch(reportSearchProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          CustomSearchBar(
            controller: controller,
            onSubmitted: () {
              setState(() {
                isKeywordSearched = true;
              });
              ref
                  .read(reportSearchProvider.notifier)
                  .paginate(keywords: controller.text);
            },
          ),
          const SizedBox(
            height: 29,
          ),
          isKeywordSearched == false
              ? const SizedBox()
              : Expanded(
                  child: reports is ReportModel
                      ? reports.reports!.length == 0
                          ? Center(
                              child: Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.27),
                                Text(
                                  "검색결과가 존재하지 않습니다.",
                                  style: FontSizes.getContentStyle().copyWith(
                                      color: theme.appColors.hintText),
                                ),
                              ],
                            ))
                          : CustomScrollView(slivers: [
                              renderReports(reports: reports.reports!)
                            ])
                      : reports is ReportCursorPaginationLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: AppColors.blueMain,
                              ),
                            )
                          : reports is ReportCursorPaginationError
                              ? Center(
                                  child: Column(
                                  children: [
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.27),
                                    Text(
                                      "검색결과가 존재하지 않습니다.",
                                      style: FontSizes.getContentStyle()
                                          .copyWith(
                                              color: theme.appColors.hintText),
                                    ),
                                  ],
                                ))
                              : const SizedBox()),
        ],
      ),
    );
  }
}
