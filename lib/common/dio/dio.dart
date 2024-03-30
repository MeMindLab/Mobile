import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:me_mind/common/constant/constant.dart';

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.method == "GET") {
      options.headers.addAll({
        "Content-type": "application/json",
      });
      final accessToken = await storage.read(key: ACCESS_TOKEN);

      if (accessToken != null) {
        options.headers.addAll({
          "Authorization": "Bearer $accessToken",
        });
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    final refreshToken = await storage.read(key: REFRESH_TOKEN);
    print("dio Error");
    if (refreshToken == null) {
      return handler.reject(err);
    }
    // 토큰 검정 실패시
    if (err.response?.statusCode == 401) {
      // refreshToken
      final dio = Dio();

      try {
        final res = await dio.post("http://$ip/token/refresh",
            options: Options(headers: {
              "refresh_token": "string",
              "grant_type": "Bearer",
            }));

        final accessToken = res.data["result"]["result"]["access_token"];
        final options = err.requestOptions;

        options.headers.addAll({'authorization': 'Bearer $accessToken'});

        await storage.write(key: ACCESS_TOKEN, value: accessToken);

        final response = await dio.fetch(options);

        return handler.resolve(response);
      } on DioException catch (e) {
        handler.reject(e);
      }
    }

    return handler.reject(err);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }
}
