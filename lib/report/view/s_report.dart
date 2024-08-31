import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/view/f_date_picker_dialog.dart';
import 'package:me_mind/common/constant/font_sizes.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/common/store.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/theme/custom_theme.dart';
import 'package:me_mind/common/theme/custom_theme_holder.dart';
import 'package:me_mind/report/component/report_chart.dart';
import 'package:me_mind/report/utils/reports.dart';
import 'package:me_mind/report/view/s_report_search.dart';
import 'package:intl/intl.dart';

class Report extends ConsumerStatefulWidget {
  const Report({super.key});

  @override
  ConsumerState<Report> createState() => _Report();
}

class _Report extends ConsumerState<Report> {
  String? date;

  @override
  void initState() {
    super.initState();

    setState(() {
      date = DateFormat("yyyy.MM").format(DateTime.now());
    });
    setBottomIdx(1);
  }

  @override
  Widget build(BuildContext context) {
    CustomTheme theme = CustomThemeHolder.of(context).theme;
    List dateList = date!.split(".");
    int reportYear = int.parse(dateList[0]);
    int reportMonth = int.parse(dateList[1]);
    final state = ref.watch(
        reportProvider(ReportParamModel(year: reportYear, month: reportMonth)));

    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '최근 감정 흐름',
                        style: FontSizes.getHeadline1Style().copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF191919),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.82,
                          maxHeight: 165,
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1.70,
                          child: ReportChart(),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Divider(
                    thickness: 8,
                    color: theme.appColors.divider,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
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
                              date!,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18.0,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        visualDensity: VisualDensity.compact,
                        icon: SvgPicture.asset('assets/svg/icon/search.svg'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => ReportSearch()));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (state is ReportCursorPaginationLoading)
            const SliverToBoxAdapter(
              child: Column(children: [
                const SizedBox(
                  height: 100,
                ),
                Center(
                  child: CircularProgressIndicator(),
                )
              ]),
            ),
          if (state is ReportModel)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              sliver: renderReports(
                  reports: state.reports!, color: AppColors.blue3),
            ),
        ],
      ),
    );
  }
}
