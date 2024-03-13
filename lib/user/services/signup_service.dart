import 'package:dio/dio.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String password, String nickname) async {
    const url = "http://10.0.2.2:8000/users/sign-up";
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

        return UserSignUpModel(
            code: body["code"], msg: body["msg"], result: body["result"]);
      }
    } on DioException catch (e) {
      return e.response!.data['detail'];
    }
  }
}
