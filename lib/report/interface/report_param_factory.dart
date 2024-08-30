import 'package:me_mind/report/model/params_month/params_month_model.dart';
import 'package:me_mind/report/model/params_search/params_search_model.dart';
import 'package:me_mind/report/services/report_monthly_service.dart';
import 'package:me_mind/report/services/report_search_service.dart';

class ReportParamFactory {
  create(
      {int? year, int? month, String? keywords, int? limit, String? cursor}) {
    if (keywords == null) {
      return ParamsMonthModel(
          year: year!, month: month!, limit: limit, cursor: cursor);
    } else {
      return ParamsSearchModel(
          keywords: keywords, limit: limit, cursor: cursor);
    }
  }
}

abstract class ReportService {
  Future fetchData({required Map<String, dynamic> parameters});
}

class ReportParameter {
  final int? year;
  final int? month;
  final String? keywords;
  final int? limit;
  final String? cursor;
  ReportParameter({
    this.year,
    this.month,
    this.keywords,
    this.limit,
    this.cursor,
  });
}

class ReportServiceFactory {
  static ReportService createService(ReportParameter params) {
    print(params.keywords);
    if (params.keywords != null) {
      return ReportSearchService();
    } else if (params.year != null && params.month != null) {
      return ReportMonthlyService();
    } else {
      throw Error();
    }
  }
}
