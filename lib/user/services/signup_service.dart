import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/user/interface/auth_interface.dart';
import 'package:me_mind/user/model/user_signup_model.dart';

class SignupService implements Isignup {
  Future<dynamic> signup(String email, String nickname, String password) async {
    final url = "http://$ip/users/signup";

    final data = {"email": email, "password": password, "nickname": nickname};

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);
      print(response);

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
