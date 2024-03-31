import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';

import 'package:me_mind/settings/model/user_info_model.dart';

class UserInfoService {
  Future findUser() async {
    Response response;
    // dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.addAll({'accessToken': true});
    String url = "http://$ip/users/me/";

    try {
      final accessToken = await storage.read(key: ACCESS_TOKEN);

      response = await dio.get(url,
          options: Options(headers: {'Authorization': "Bearer $accessToken"}));

      if (response.statusCode == 200) {
        var result = response.data;

        UserInfoModel userInfo = UserInfoModel.fromJson(result);

        return userInfo;
      } else {
        return null;
      }
    } on DioException catch (error) {
      print("Report Search: dio get error:$error");
      return null;
    } catch (e) {
      return null;
    }
  }
}
