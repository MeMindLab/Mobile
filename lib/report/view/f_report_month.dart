import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/s_report_search.dart';
import 'package:me_mind/common/utils/dialog_manager.dart';

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
                    highlightColor: AppColors.invisibleColor,
                    splashColor: AppColors.invisibleColor,
                    onTap: () {
                      DialogManager(context: context, type: DialogType.custom)
                          .show(
                        customWidget: CustomDatePicker(
                          selectedDate: DateTime.now(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          datetime,
                          style: FontSizes.getHeadline1Style()
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 18.0,
                          color: AppColors.blackColor,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => const ReportSearch()));
                  },
                  icon: SvgPicture.asset(
                    'assets/svg/icon/search.svg',
                    width: 20,
                    height: 20,
                    colorFilter: const ColorFilter.mode(
                      AppColors.blackColor,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: reports!.isEmpty
              ? SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.33,
                      ),
                      Center(
                        child: Text("리포트가 없습니다.",
                            style: FontSizes.getContentStyle().copyWith(
                                fontWeight: FontWeight.w500,
                                color: AppColors.gray5)),
                      ),
                    ],
                  ),
                )
              : renderReports(reports: reports!),
        ),
      ],
    );
  }
}
