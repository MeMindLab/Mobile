import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String password, String nickname) async {
    final url = "http://$ip/users/signup";

    final data = {
      "email": email,
      "password": password,
      "username": nickname,
      "nickname": nickname
    };

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);

      if (response.statusCode == 201) {
        var body = response.data;
        return UserSignUpModel(msg: body["message"]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 400) {
        return e.response!.data['message'];
      } else {
        return null;
      }
    }
  }
}
