import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:me_mind/chat/model/chat_start_model.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

final chatStartServiceProvider = Provider<ChatStartService>((ref) {
  // final dio = ref.watch(dioProvider);

  final chatStartService = ChatStartService();

  return chatStartService;
});

class ChatStartService {
  Future load(String date) async {
    final url = "http://$ip/chat/start";
    Map<String, dynamic> data = {"date": date};

    final dio = Dio();
    Response response;
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers
        .addAll({'accessToken': true, 'Content-Type': 'application/json'});

    try {
      response = await dio.post(
        url,
        data: jsonEncode(data),
      );

      var result = response.data;

      ChatStartModel answer = ChatStartModel.fromJson(result);

      return answer;
    } on DioException catch (error) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
