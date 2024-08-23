import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/model/report_month/report_month_model.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/f_date_picker_dialog.dart';
import 'package:me_mind/report/view/s_report_search.dart';

class ReportMonthFragment extends StatelessWidget {
  final String datetime;
  final List<Report>? reports;

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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: () {
                      Dialogs(
                              context: context,
                              content: CustomDatePicker(
                                selectedDate: DateTime.now(),
                              ),
                              contentPadding: EdgeInsets.zero)
                          .callDateDialog();
                    },
                    child: Row(
                      children: [
                        Text(
                          datetime,
                          style: FontSizes.getHeadline1Style()
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18.0,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    // 아이콘 버튼의 동작을 정의합니다.
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ReportSearch()));
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/icon/search.svg',
                    width: 20,
                    height: 20,
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
        (reports == null || reports!.isEmpty || datetime == "2024.01")
            ? SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.31,
                    ),
                    Text(
                      "리포트가 존재하지 않습니다",
                      style: FontSizes.getTextStyle().copyWith(
                        color: noficiationColor,
                      ),
                    ),
                  ],
                ))
            : SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: renderReports(reports: reports!),
              ),
      ],
    );
  }
}
