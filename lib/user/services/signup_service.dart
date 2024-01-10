import 'package:dio/dio.dart';
import 'package:me_mind/user/interface/auth_interface.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String password, String nickname) async {
    const url = "http://54.206.203.208/users/sign-up";
    final data = {"email": email, "password": password, "username": nickname};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);

      print(response.statusCode);
    } on DioException catch (e) {
      print("singup 에러: $e");
    }
  }
}
