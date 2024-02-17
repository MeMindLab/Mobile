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
      // throw new DioException(
      //     type: DioExceptionType.connectionError,
      //     error: {"message": "Invalid Email"},
      //     response: await dio.post(url, data: data),
      //     message: "Invalid Email",
      //     requestOptions: RequestOptions());
      response = await dio.post(url, data: data);

      if (response.statusCode == 201) {
        var body = response.data;

        return UserSignUpModel(
            code: body["code"], msg: body["msg"], result: body["result"]);
      } else {
        return null;
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 409) {
        switch (e.message) {
          case 'Invalid Nickname':
            return 'nickname';
          case 'Invalid Email':
            return 'email';
          default:
            return "nickname, email";
        }
      }
      // if (e.type == DioExceptionType.connectionError) {
      //   switch (e.message) {
      //     case 'Invalid Nickname':
      //       return 'nickname';
      //     case 'Invalid Email':
      //       return 'email';
      //     default:
      //       return "nickname, email";
      //   }
      // }
      return null;
    }
  }
}
