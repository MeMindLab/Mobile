import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:me_mind/chat/model/chat_start_model.dart';
import 'package:me_mind/common/dio/dio.dart';

final chatStartServiceProvider = Provider<ChatStartService>((ref) {
  final dio = ref.watch(dioProvider);

  final chatStartService = ChatStartService(dio: dio);

  return chatStartService;
});

class ChatStartService {
  final Dio dio;

  ChatStartService({
    required this.dio,
  });

  Future load(String date) async {
    const url = "http://10.0.2.2:8000/chat/start";
    final data = {"date": date};

    // final dio = Dio();
    Response response;
    // dio.interceptors.add(CustomInterceptor(storage: storage));
    // dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});

    try {
      response = await dio.post(url, data: data);
      print(dio.options.headers);

      if (response.statusCode == 200) {
        var result = response.data;

        ChatStartModel answer = ChatStartModel.fromJson(result);

        return answer;
      } else {
        return null;
      }
    } on DioException catch (error) {
      return error;
    } catch (e) {
      return null;
    }
  }
}
