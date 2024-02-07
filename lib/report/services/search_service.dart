import 'package:dio/dio.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';

class SearchService {
  Future search(String keyword) async {
    String uriKeyword = Uri.encodeQueryComponent(keyword);

    String url = 'http://52.65.66.124/report/search/$uriKeyword';

    final dio = Dio();
    Response response;

    try {
      response = await dio.get(url);
      if (response.statusCode == 200) {
        var body = response.data;

        ReportSearchModel searchResult = ReportSearchModel.fromJson(body);
        if (searchResult.result.report.isEmpty) {
          return null;
        } else {
          return searchResult.result.report;
        }
      }
    } on DioException catch (error) {
      print("Report Search: dio get error:$error");
      return null;
    }
  }
}
