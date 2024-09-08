import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/user/model/user_signin_model.dart';

class TokenRefreshService {
  Future refresh() async {
    final dio = Dio(BaseOptions(baseUrl: "$ip/", headers: {}));
    String url = 'token/refresh';

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
      return null;
    } catch (e) {
      return null;
    }
  }
}
