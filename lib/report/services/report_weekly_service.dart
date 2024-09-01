import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_weekly/report_weekly_model.dart';

class ReportWeeklyService {
  Future fetchData({required String date}) async {
    final url = "http://$ip/report/weekly-scores";

    Map<String, dynamic> parameters = {"date": date};

    final dio = Dio();
    Response response;

    try {
      response = await dio.get(url, queryParameters: parameters);
      print(response.data);

      ReportWeeklyModel result = ReportWeeklyModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
