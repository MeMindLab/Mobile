import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/model/report_weekly/report_weekly_model.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/services/report_weekly_service.dart';
import 'package:me_mind/report/utils/weekly_flchart_data.dart';
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
import 'package:me_mind/common/utils/dialog_manager.dart';

class Report extends ConsumerStatefulWidget {
  const Report({super.key});

  @override
  ConsumerState<Report> createState() => _Report();
}

class _Report extends ConsumerState<Report> {
  String? date;
  String? weeklyDate;
  Future<ReportWeeklyModel>? _future;

  final ScrollController scrollController = ScrollController();
  void scrollListener() {
    if (scrollController.offset >
        scrollController.position.maxScrollExtent - 300) {
      String defaultDateTime = DateFormat("yyyy.MM").format(DateTime.now());
      List dateList = defaultDateTime.split(".");
      int reportYear = int.parse(dateList[0]);
      int reportMonth = int.parse(dateList[1]);
      ref
          .read(reportProvider(
                  ReportParamModel(year: reportYear, month: reportMonth))
              .notifier)
          .paginate(fetchMore: true, year: reportYear, month: reportMonth);
    }
  }

  Future<ReportWeeklyModel>? _fetchData() async {
    final result = await ReportWeeklyService().fetchData(date: weeklyDate!);
    return result;
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    setState(() {
      date = DateFormat("yyyy.MM").format(DateTime.now());
      weeklyDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
    });
    setBottomIdx(1);
    _future = _fetchData();
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
        controller: scrollController,
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
                          color: AppColors.blackColor.withOpacity(0.9),
                        ),
                      ),
                      const SizedBox(height: 36),
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.82,
                          maxHeight: 165,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.70,
                          child: FutureBuilder(
                              future: _future,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                      child: Transform.translate(
                                    offset: const Offset(15, -1),
                                    child: const CircularProgressIndicator(
                                      color: AppColors.blueMain,
                                    ),
                                  ));
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return const Center(
                                        child: Text('최근 감정흐름을 불러오지 못했습니다.'));
                                  } else if (snapshot.hasData) {
                                    final result =
                                        snapshot.data as ReportWeeklyModel;

                                    List<String> dates =
                                        result.results!.length == 0
                                            ? []
                                            : result.results!
                                                .map((item) => item.date)
                                                .toList();

                                    List<FlSpot> newSpots = WeeklyFlChartData()
                                        .getScore(weeklymodel: result);

                                    List<String> newDates = WeeklyFlChartData()
                                        .getDates(dates: dates);

                                    return ReportChart(
                                      dates: newDates,
                                      spots: newSpots,
                                    );
                                  }
                                }
                                return Container();
                              }),
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
                        highlightColor: AppColors.invisibleColor,
                        splashColor: AppColors.invisibleColor,
                        onTap: () {
                          DialogManager(
                                  context: context, type: DialogType.custom)
                              .show(
                            customWidget: CustomDatePicker(
                              selectedDate: DateTime.now(),
                            ),
                          );
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
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              size: 18.0,
                              color: AppColors.blackColor,
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
                                  builder: (_) => const ReportSearch()));
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
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blueMain,
                  ),
                )
              ]),
            ),
          if (state is ReportCursorPaginationError)
            const SliverToBoxAdapter(
              child: Column(children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text("리포트를 불러오지 못했습니다."),
                )
              ]),
            ),
          if (state is ReportModel)
            state.reports!.isEmpty
                ? const SliverToBoxAdapter(
                    child: Column(children: [
                      SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Text("리포트가 없습니다."),
                      )
                    ]),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    sliver: renderReports(
                        reports: state.reports!, color: AppColors.blue3),
                  ),
        ],
      ),
    );
  }
}
