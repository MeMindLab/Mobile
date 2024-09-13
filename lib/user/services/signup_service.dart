import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService {
  Future<dynamic> signup(
      String email, String nickname, String password, String referral) async {
    final url = "$ip/users/signup";

    final data = referral == ""
        ? {"email": email, "password": password, "nickname": nickname}
        : {
            "email": email,
            "password": password,
            "nickname": nickname,
            "referral_code": referral
          };

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: jsonEncode(data));

      var body = response.data;
      return UserSignUpModel.fromJson(body);
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return e.response!.data['message'];
      } else {
        return null;
      }
    }
  }
}
