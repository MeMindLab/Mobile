import 'package:dio/dio.dart';
import 'package:me_mind/report/utils/reports.dart';

class SearchService {
  Future search(String keyword) async {
    const url = 'http://54.206.203.208/report/search';
    print(keyword);
    final dio = Dio();
    Response response;

    //임시
    List<ReportData> reports = [
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
      ReportData(
        keywords: ["키워드1", "키워드2"],
        summary:
            "이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summary 내용이 들어가게 됩니다이곳에는 ai summa이곳에는 ai summary 내용이 들어가게 됩니다.",
        date: '2023.10.31',
      ),
    ];

    try {
      response =
          await dio.get(url, queryParameters: {"search_keyword": keyword});
      if (response.statusCode == 200) {
        // return null;
        return reports;
      }
    } on DioException catch (error) {
      print("Report Search: dio get error:$error");
      return null;
    }
  }
}
