import 'package:dio/dio.dart';

import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signin_model.dart';

class LoginService implements ILogin {
  @override
  Future login(String email, String password) async {
    final url = "$ip/auth/login";
    final data = {"email": email, "password": password};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);
      if (response.statusCode == 200) {
        final body = response.data;

        return SignInResult.fromJson(body);
      } else {
        return null;
      }
    } on DioException catch (error) {
      print("Error occurred: dio 에러 ? $error");
      return null;
    }
  }
}

class AuthService implements IAuthService {
  final LoginService _loginService = LoginService();

  @override
  ILogin get loginService => _loginService; // 로그인 서비스를 바로 반환

  // TODO: 회원가입 서비스 연결
  @override
  Isignup? get signupService => null;
}
