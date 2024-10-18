import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/interface/report_param_factory.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';

class ReportMonthlyService implements ReportService {
  @override
  Future fetchData({required Map<String, dynamic> parameters}) async {
    final url = "$ip/report/monthly-reports";

    final dio = Dio();
    Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({'accept': "application/json"});

    try {
      response = await dio.get(url, queryParameters: parameters);

      ReportModel result = ReportModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
