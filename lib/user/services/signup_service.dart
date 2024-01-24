import 'package:dio/dio.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String password, String nickname) async {
    const url = "http://54.206.203.208/users/sign-up";
    final data = {"email": email, "password": password, "username": nickname};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);

      print(response.statusCode);
      // response.statusCode = 403;
      // success response
      if (response.statusCode == 201) {
        var body = response.data;

        return [
          response.statusCode,
          UserSignUpModel(
              code: body["code"], msg: body["msg"], result: body["result"])
        ];
      }
      // validation error
      if (response.statusCode == 403) {
        return [
          response.statusCode,
          {"code": "0", "msg": "validation error", "result": "Invalid email"}
        ];
      }
    } on DioException catch (e) {
      print("singup 에러: $e");
    }
  }
}