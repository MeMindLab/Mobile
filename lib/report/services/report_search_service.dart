import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/interface/report_param_factory.dart';
import 'package:me_mind/report/model/report_model/report_model.dart';

class ReportSearchService implements ReportService {
  @override
  Future fetchData({required Map<String, dynamic> parameters}) async {
    final url = "$ip/report/search";
    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, queryParameters: parameters);

      ReportModel result = ReportModel.fromJson(response.data);

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
