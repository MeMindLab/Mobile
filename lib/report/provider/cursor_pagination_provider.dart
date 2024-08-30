import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/report/interface/report_param_factory.dart';
import 'package:me_mind/report/model/params_month/params_month_model.dart';
import 'package:me_mind/report/model/params_search/params_search_model.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';
import 'package:me_mind/report/model/report_param/report_param_model.dart';
import 'package:me_mind/report/services/report_monthly_service.dart';

final reportProvider = StateNotifierProvider.family<ReportStateNotifier,
    ReportCursorPaginationBase, ReportParamModel?>((ref, param) {
  final notifier = ReportStateNotifier(param);
  return notifier;
});

class ReportStateNotifier extends StateNotifier<ReportCursorPaginationBase> {
  final ReportParamModel? param;
  ReportStateNotifier(this.param) : super(ReportCursorPaginationLoading()) {
    paginate(year: param!.year, month: param!.month, keywords: param!.keyword);
  }

  Future<void> paginate(
      {int fetchCount = 6,
      bool fetchMore = false,
      int? year,
      int? month,
      String? keywords}) async {
    try {
      final isLoading = state is ReportCursorPaginationLoading;
      final isFetchMore = state is ReportCursorPaginationFetchingMore;
      var parameters = keywords == null
          ? ParamsMonthModel(year: year!, month: month!, limit: fetchCount)
          : ParamsSearchModel(keywords: keywords, limit: fetchCount);

      // 새로고침하는 경우
      if (fetchMore && (isLoading || isFetchMore)) {
        return;
      }
      if (fetchMore) {
        final pState = state as ReportModel;
        if (pState.nextCursor == null) return;
        // 무한 스크롤
        state = ReportCursorPaginationFetchingMore(
            nextCursor: pState.nextCursor, reports: pState.reports);
        parameters = parameters.copyWith(cursor: pState.nextCursor);
      } else {
        state = ReportCursorPaginationLoading();
      }

      ReportService service = ReportServiceFactory.createService(
          ReportParameter(year: year, month: month, keywords: keywords));

      ReportModel response =
          await service.fetchData(parameters: parameters.toJson());

      if (state is ReportCursorPaginationFetchingMore) {
        final pState = state as ReportCursorPaginationFetchingMore;

        state = response
            .copyWith(reports: [...pState.reports!, ...response.reports!]);
      } else {
        state = response;
      }
    } catch (e) {
      state = ReportCursorPaginationError();
    }
  }
}

abstract class ParamsModel {
  ParamsModel copyWith({String? cursor});
  Map<String, dynamic> toJson();
}
