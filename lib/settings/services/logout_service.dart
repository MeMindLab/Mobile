import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';

class LogoutService {
  Future logout() async {
    var url = '$ip/users/logout';

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url);
      if (response.statusCode == 200) {
        final body = response.data;

        return body;
      }
    } on DioException catch (e) {
      return null;
    }
  }
}
