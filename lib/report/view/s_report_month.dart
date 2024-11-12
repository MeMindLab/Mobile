import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/component/root_tab.dart';
import 'package:me_mind/common/constant/app_colors.dart';
import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/view/f_report_month.dart';
import 'package:intl/intl.dart';

class ReportMonth extends ConsumerStatefulWidget {
  final DateTime selectedDate;

  const ReportMonth({super.key, required this.selectedDate});

  @override
  ConsumerState<ReportMonth> createState() => _ReportMonthState();
}

class _ReportMonthState extends ConsumerState<ReportMonth> {
  late DateTime reportDate;
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(scrollListener);
    setState(() {
      reportDate = widget.selectedDate;
    });
  }

  void scrollListener() {
    if (scrollController.offset >
        scrollController.position.maxScrollExtent - 300) {
      String defaultDateTime = DateFormat("yyyy.MM").format(reportDate);
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
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String defaultDateTime = DateFormat("yyyy.MM").format(reportDate);
    List dateList = defaultDateTime.split(".");
    int reportYear = int.parse(dateList[0]);
    int reportMonth = int.parse(dateList[1]);

    final state = ref.watch(
        reportProvider(ReportParamModel(year: reportYear, month: reportMonth)));

    if (state is ReportCursorPaginationLoading) {
      return const DefaultLayout(
          title: "리포트",
          appBarLeading: BackArrowLeading(),
          bottomNavigationBar: RootTab(),
          child: Center(
              child: CircularProgressIndicator(
            color: AppColors.blueMain,
          )));
    }
    if (state is ReportCursorPaginationError) {
      return const DefaultLayout(
          title: "리포트",
          appBarLeading: BackArrowLeading(),
          bottomNavigationBar: RootTab(),
          child: Center(child: Text("레포트를 불러오지 못했습니다.")));
    }
    final newState = state as ReportModel;
    return DefaultLayout(
      title: "리포트",
      appBarLeading: const BackArrowLeading(),
      bottomNavigationBar: const RootTab(),
      child: SingleChildScrollView(
        controller: scrollController,
        child: Column(children: [
          ReportMonthFragment(
            reports: newState.reports,
            datetime: defaultDateTime,
          ),
          if (state is ReportCursorPaginationFetchingMore)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ]),
      ),
    );
  }
}
