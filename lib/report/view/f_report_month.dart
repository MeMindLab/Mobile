import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/utils/reports.dart';

class ReportMonthFragment extends StatelessWidget {
  final String datetime;
  final List<ReportData>? reports;

  const ReportMonthFragment({
    super.key,
    required this.datetime,
    this.reports,
  });

  @override
  Widget build(BuildContext context) {
    Color noficiationColor =
        CustomThemeHolder.of(context).theme.appColors.datetimeColor;

    return CustomScrollView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(23, 0, 20, 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    datetime,
                    style: FontSizes.getHeadline1Style()
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // 아이콘 버튼의 동작을 정의합니다.
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/icon/search.svg',
                    width: 24,
                    height: 24,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        reports != null && reports!.isNotEmpty
            ? SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: renderReports(reports!),
              )
            : SliverFillRemaining(
                hasScrollBody: false,
                child: Center(
                  child: Text(
                    "리포트가 존재하지 않습니다",
                    style: FontSizes.getTextStyle().copyWith(
                      color: noficiationColor,
                    ),
                  ),
                ),
              ),
      ],
    );
  }
}
