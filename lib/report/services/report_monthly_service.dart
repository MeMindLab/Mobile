import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';

class ReportMonthlyService {
  Future getReports({required Map<String, dynamic> parameters}) async {
    final url = "http://$ip/report/monthly-reports";

    // Map<String, dynamic> parameters = {"year": 2024, "month": 8, "limit": 5};

    final dio = Dio();
    Response response;

    try {
      response = await dio.get(url, queryParameters: parameters);

      ReportModel result = ReportModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
