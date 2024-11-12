import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/settings/model/auth_sms_model.dart';
import 'package:me_mind/settings/model/auth_sms_verify_model.dart';

class AuthSmsService {
  Future sendSms({required String phone}) async {
    final url = "$ip/auth/sms";
    String newPhone = phone.replaceAll('-', '');

    final dio = Dio();
    final Response response;
    dio.options.headers.clear();
    dio.options.headers.addAll({
      "accept": "application/json",
    });

    try {
      response = await dio.post("$url?phone=$newPhone");

      var result = response.data;
      print(result);
      AuthSmsModel authSmsModel = AuthSmsModel.fromJson(result);

      return authSmsModel;
    } catch (e) {
      return null;
    }
  }

  Future sendVerify({required String phone, required String code}) async {
    String newPhone = phone.replaceAll('-', '');
    final url = "$ip/auth/sms-verify";
    final dio = Dio();
    final Response response;
    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers
        .addAll({'accessToken': true, 'accept': 'application/json'});

    try {
      response = await dio
          .post(url, queryParameters: {'phone_number': newPhone, "code": code});

      AuthSmsVerifyModel authSmsModel =
          AuthSmsVerifyModel.fromJson(response.data);

      return authSmsModel;
    } catch (error) {
      return null;
    }
  }
}
