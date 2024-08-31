import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/report/interface/report_param_factory.dart';
import 'package:me_mind/report/model/params_search/params_search_model.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';

final reportSearchProvider =
    StateNotifierProvider<ReportStateNotifier, ReportCursorPaginationBase?>(
        (ref) {
  final notifier = ReportStateNotifier();
  return notifier;
});

class ReportStateNotifier extends StateNotifier<ReportCursorPaginationBase> {
  ReportStateNotifier() : super(ReportCursorPaginationLoading()) {
    paginate();
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
      var parameters =
          ParamsSearchModel(keywords: keywords!, limit: fetchCount);

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
          ReportParameter(keywords: keywords));

      final ReportModel response =
          await service.fetchData(parameters: parameters.toJson());

      if (state is ReportCursorPaginationFetchingMore) {
        final pState = state as ReportCursorPaginationFetchingMore;

        state = response
            .copyWith(reports: [...pState.reports!, ...response.reports!]);
      } else {
        final newReports = [...response.reports!];
        state = response.copyWith(reports: [...newReports]);
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
