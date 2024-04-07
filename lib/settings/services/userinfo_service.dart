import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';

import 'package:me_mind/settings/model/user_info_model.dart';

class UserInfoService {
  Future findUser() async {
    final dio = Dio();

    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});
    String url = "http://$ip/users/me/";

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        var result = response.data;

        UserInfoModel userInfo = UserInfoModel.fromJson(result);

        return userInfo;
      } else {
        return null;
      }
    } on DioException catch (error) {
      print("UserInfo Search: dio get error:$error");
      return null;
    } catch (e) {
      return null;
    }
  }
}
