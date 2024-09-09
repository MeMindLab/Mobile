import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:me_mind/common/component/custom_date_picker.dart';
import 'package:me_mind/common/component/dialog/custom_dialog.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/model/report_weekly/report_weekly_model.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/services/report_weekly_service.dart';
import 'package:me_mind/report/utils/weekly_flchart_data.dart';
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
import 'package:me_mind/common/utils/dialog_manager.dart';

class Report extends ConsumerStatefulWidget {
  const Report({super.key});

  @override
  ConsumerState<Report> createState() => _Report();
}

class _Report extends ConsumerState<Report> {
  String? date;
  String? weeklyDate;
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

  @override
  void initState() {
    super.initState();
    scrollController.addListener(scrollListener);
    setState(() {
      date = DateFormat("yyyy.MM").format(DateTime.now());
      weeklyDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
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
                        child: AspectRatio(
                          aspectRatio: 1.70,
                          child: FutureBuilder(
                              future: ReportWeeklyService()
                                  .fetchData(date: weeklyDate!),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                } else if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (snapshot.hasError) {
                                    return Center(
                                        child:
                                            Text('Error: ${snapshot.error}'));
                                  } else if (snapshot.hasData) {
                                    final result =
                                        snapshot.data as ReportWeeklyModel;
                                    print(result);
                                    List<TodayScore> newData =
                                        result.results!.length == 0
                                            ? []
                                            : result.results!;
                                    // print(newData);

                                    int totalLength = newData.length;
                                    print(totalLength);
                                    List<TodayScore> newBox =
                                        newData.length == 0 ? [] : newData;
                                    print(newBox);

                                    List<String> dates = newBox
                                        .map((item) => item.date)
                                        .toList();
                                    List<FlSpot> flSpots = [];
                                    for (int i = 0; i < newBox.length; i++) {
                                      flSpots.add(FlSpot((i * 2).toDouble(),
                                          newBox[i].score / 20));
                                    }

                                    // while (dates.length < 7) {
                                    //   dates.add("");
                                    // }
                                    DateFormat dateFormat = DateFormat('MM/dd');
                                    WeeklyFlChartData().getDates(dates: dates);
                                    if (dates.isEmpty) {
                                      dates.add(
                                          dateFormat.format(DateTime.now()));
                                    }
                                    String lastDateString = dates.last;
                                    DateTime lastDate =
                                        dateFormat.parse(lastDateString);

                                    for (int i = 1;
                                        i < 7 - totalLength + 1;
                                        i++) {
                                      DateTime newDate =
                                          lastDate.add(Duration(days: i));
                                      dates.add(dateFormat.format(newDate));
                                    }
                                    // print(dates);
                                    WeeklyFlChartData().getDates(dates: dates);

                                    // while (flSpots.length < 7) {
                                    //   flSpots.add(FlSpot(
                                    //       (flSpots.length * 2).toDouble(),
                                    //       0.07));
                                    // }

                                    return ReportChart(
                                      dates: dates,
                                      data: newBox,
                                      spots: flSpots,
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
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
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
                  child: CircularProgressIndicator(),
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
