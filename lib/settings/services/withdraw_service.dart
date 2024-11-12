import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

class WithDrawService {
  Future withDraw({required String password, required List reason}) async {
    final dio = Dio();
    final data = {"password": password, "delete_reasons": reason};
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers
        .addAll({'accessToken': true, "accept": "application/json"});

    String url = "$ip/users/withdraw";

    try {
      final response = await dio.delete(url, data: jsonEncode(data));

      return true;
    } on DioException catch (error) {
      print(error);
      return null;
    } catch (e) {
      return null;
    }
  }
}
