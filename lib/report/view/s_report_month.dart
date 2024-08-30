import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/component/root_tab.dart';

import 'package:me_mind/common/layout/default_layout.dart';
import 'package:me_mind/common/layout/topbar/widget/back_arrow.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/provider/cursor_pagination_provider.dart';
import 'package:me_mind/report/services/report_monthly_service.dart';
import 'package:me_mind/report/utils/reports.dart';
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
      ref
          .read(reportProvider(
                  ReportParamModel(year: 2024, month: 8, keyword: ""))
              .notifier)
          .paginate(fetchMore: true, year: 2024, month: 8);
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
    final state = ref.watch(
        reportProvider(ReportParamModel(year: 2024, month: 8, keyword: "")));

    if (state is ReportCursorPaginationLoading) {
      return const DefaultLayout(
          title: "리포트",
          appBarLeading: BackArrowLeading(),
          bottomNavigationBar: RootTab(),
          child: Center(child: CircularProgressIndicator()));
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
          )
        ]),
      ),
    );
  }
}
