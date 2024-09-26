import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_detail/report_detail_model.dart';

class ReportDetailService {
  Future show({required String conversationId}) async {
    final url = "$ip/report/detail/$conversationId";
    final dio = Dio();

    Response response;

    try {
      print(url);
      response = await dio.get(url);
      print(response.data);

      ReportDetailModel result = ReportDetailModel.fromJson(response.data);

      return result;
    } catch (e) {
      return null;
    }
  }
}
