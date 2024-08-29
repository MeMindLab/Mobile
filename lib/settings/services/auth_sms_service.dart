import 'package:dio/dio.dart';
import 'package:me_mind/settings/model/auth_sms_model.dart';
import 'package:me_mind/settings/model/auth_sms_verify_model.dart';

class AuthSmsService {
  Future sendSms({required String phone}) async {
    const url = "http://10.0.2.2:8000/auth/sms";
    String newPhone = phone.replaceAll('-', '');

    final dio = Dio();
    final Response response;

    try {
      response = await dio.post("$url?phone=$newPhone");

      var result = response.data;

      AuthSmsModel authSmsModel = AuthSmsModel.fromJson(result);

      return authSmsModel;
    } catch (e) {
      return null;
    }
  }

  Future sendVerify({required String phone, required String code}) async {
    const url = "http://10.0.2.2:8000/auth/sms-verify";
    String newPhone = phone.replaceAll('-', '');

    final dio = Dio();
    final Response response;

    try {
      response = await dio.post("$url?phone_number=$newPhone&code=$code");

      var result = response.data;

      AuthSmsVerifyModel authSmsModel = AuthSmsVerifyModel.fromJson(result);

      return authSmsModel;
    } catch (e) {
      return null;
    }
  }
}
