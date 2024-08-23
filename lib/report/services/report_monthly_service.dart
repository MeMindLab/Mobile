import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_month/report_month_model.dart';

class ReportMonthlyService {
  Future getReports() async {
    final url = "http://$ip/report/monthly-reports";
    Map<String, dynamic> parameters = {"year": 2024, "month": 8, "limit": 5};

    final dio = Dio();
    Response response;

    try {
      response = await dio.get(url, queryParameters: parameters);

      ReportMonthModel result = ReportMonthModel.fromJson(response.data);

      return result;
    } catch (e) {
      return null;
    }
  }
}
