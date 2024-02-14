import 'package:dio/dio.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String password, String nickname) async {
    const url = "http://52.65.66.124/users/sign-up";
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

      print(response.statusCode);
      if (response.statusCode == 201) {
        var body = response.data;

        return UserSignUpModel(
            code: body["code"], msg: body["msg"], result: body["result"]);
      }
      // validation error
      if (response.statusCode == 403) {
        var serverMsg = response.data['message'];
        switch (serverMsg) {
          case 'Invalid Nickname':
            return 'nickname';
          case 'Invalid Email':
            return 'email';
          default:
            return "nickname, email";
        }
      }
    } on DioException catch (e) {
      print("singup 에러: $e");
    }
  }
}
