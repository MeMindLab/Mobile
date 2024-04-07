import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/user/model/user_signin_model.dart';

class TokenRefreshService {
  Future refresh() async {
    final dio = Dio();

    String url = 'token/refresh';

    dio.options.baseUrl = "http://10.0.2.2:8000/";
    dio.options.headers.clear();
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.addAll({'refreshToken': true});

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        var result = response.data;

        SignInResult tokenResult = SignInResult.fromJson(result);

        return tokenResult;
      } else {
        return null;
      }
    } on DioException catch (error) {
      print("token Error: dio get error:$error");
      return null;
    } catch (e) {
      return null;
    }
  }
}
