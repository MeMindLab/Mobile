import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';

class LemonService {
  Future getLemon() async {
    final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/", headers: {}));

    String url = 'users/1/lemon';

    dio.interceptors.add(CustomInterceptor(storage: storage));

    try {
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        var result = response.data;

        UserLemonModel lemonResult = UserLemonModel.fromJson(result);

        return lemonResult;
      } else {
        return null;
      }
    } on DioException catch (error) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
