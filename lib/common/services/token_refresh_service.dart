import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/user/model/user_signin_model.dart';

class TokenRefreshService {
  Future refresh() async {
    final dio = Dio();
    String url = '$ip/auth/token/refresh';

    dio.options.headers.clear();
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.addAll({'refreshToken': true});

    try {
      print("Hi");
      final response = await dio.get(url);
      print(response);

      SignInResult tokenResult = SignInResult.fromJson(response.data);

      return tokenResult;
    } catch (e) {
      rethrow;
    }
  }
}
