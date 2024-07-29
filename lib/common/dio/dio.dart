import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/storage/secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();

  final storage = ref.watch(secureStorageProvider);

  dio.interceptors.add(CustomInterceptor(storage: storage));

  return dio;
});

class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;

  CustomInterceptor({required this.storage});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers["accessToken"] == true) {
      options.headers.remove("accessToken");
      final accessToken = await storage.read(key: ACCESS_TOKEN);

      options.headers.addAll({
        "authorization": "Bearer $accessToken",
      });
    }
    if (options.headers["refreshToken"] == true) {
      options.headers.remove("refreshToken");
      final refreshToken = await storage.read(key: REFRESH_TOKEN);

      options.headers.addAll({
        "authorization": "Bearer $refreshToken",
      });
    }

    return super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN);

    if (refreshToken == null) {
      return handler.reject(err);
    }
    final isRefereshTokenPath = err.requestOptions.path == 'token/refersh';

    if (err.response?.statusCode == 401 && !isRefereshTokenPath) {
      final dio = Dio();

      try {
        final res = await dio.get("http://10.0.2.2:8000/token/refresh",
            options: Options(headers: {
              "authorization": "Bearer $refreshToken",
            }));

        final accessToken = res.data["access_token"];
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
    super.onResponse(response, handler);
  }
}
