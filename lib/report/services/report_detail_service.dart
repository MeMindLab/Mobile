import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_detail/report_detail_model.dart';

class ReportDetailService {
  Future show({required String reportId}) async {
    final url = "$ip/report/$reportId";
    final dio = Dio();

    Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({'accept': "application/json"});

    try {
      response = await dio.get(url);

      ReportDetailModel result = ReportDetailModel.fromJson(response.data);

      return result;
    } catch (e) {
      return null;
    }
  }
}
