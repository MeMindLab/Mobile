import 'package:me_mind/report/model/params_month/params_month_model.dart';
import 'package:me_mind/report/model/params_search/params_search_model.dart';

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
