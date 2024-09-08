import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';

class SearchService {
  Future search(String keyword) async {
    final dio = Dio();

    String uriKeyword = Uri.encodeQueryComponent(keyword);
    String url = 'report/search/$uriKeyword';

    dio.options.baseUrl = "$ip/";
    Response response;

    try {
      response = await dio.get(url);

      if (response.statusCode == 200) {
        var result = response.data;

        ReportSearchModel searchResult = ReportSearchModel.fromJson(result);

        return searchResult.result.report;
      } else {
        return null;
      }
    } on DioException catch (error) {
      print("Report Search: dio get error:$error");
    } catch (e) {
      print("$e");
    }
  }
}
