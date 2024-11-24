import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
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
    dio.options.headers.clear();

    dio.options.headers.addAll({
      'accept': 'application/json',
      "Content-Type": 'application/json',
    });

    try {
      print(data);
      var response = await dio.post(url, data: jsonEncode(data));
      print(response);
      final result = UserSignUpModel.fromJson(response.data);

      // return result;

      return {"success": true};
    } on DioException catch (e) {
      print(e);
      // return e.response!.data["detail"];
      return {"success": false, "message": e.response!.data["detail"]};
    }
  }
}
