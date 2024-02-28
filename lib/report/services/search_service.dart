import 'package:dio/dio.dart';
import 'package:me_mind/report/model/report_search/report_search_model.dart';

class SearchService {
  Future search(String keyword) async {
    String uriKeyword = Uri.encodeQueryComponent(keyword);
    String url = 'report/search/$uriKeyword';

    final dio = Dio();
    dio.options.baseUrl = "http://52.65.66.124/";
    Response response;

    try {
      response = await dio.get(url);
      var result = response.data;

      ReportSearchModel searchResult = ReportSearchModel.fromJson(result);

      return searchResult.result;
    } on DioException catch (error) {
      print("Report Search: dio get error:$error");
      return null;
    }
  }
}
