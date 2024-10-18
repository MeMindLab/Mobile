import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_weekly/report_weekly_model.dart';

class ReportWeeklyService {
  Future fetchData({required String date}) async {
    final url = "$ip/report/weekly-scores?target_date=$date";
    final dio = Dio();
    Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({'accept': "application/json"});

    try {
      response = await dio.get(url);

      ReportWeeklyModel result = ReportWeeklyModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
