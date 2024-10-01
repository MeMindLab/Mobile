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

    try {
      print(data);
      response = await dio.post(url, data: jsonEncode(data));
      print(response);

      // return UserSignUpModel.fromJson(response.data);
      //{'success': true, ''}
      return {"success": true};
    } on DioException catch (e) {
      // print({"success": false, "message": e.response!.data["detail"]});
      // return e.response!.data['detail'];
      return {"success": false, "message": e.response!.data["detail"]};
    }
  }
}
