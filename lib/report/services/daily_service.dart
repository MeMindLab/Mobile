import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/report/model/create_daily/create_daily_model.dart';

class DailyService {
  Future create({required String id}) async {
    final url = "http://$ip/report/create-daily";
    final data = {"conversation_id": id};

    final dio = Dio();
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});
    Response response;

    try {
      response = await dio.post(url, data: jsonEncode(data));

      CreateDailyModel cdModel = CreateDailyModel.fromJson(response.data);

      return cdModel;
    } catch (error) {
      return null;
    }
  }
}
