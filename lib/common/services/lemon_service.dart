import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/model/user_lemon_patch_model.dart';

class LemonService {
  Future getLemon({required String userId}) async {
    final dio = Dio(BaseOptions(baseUrl: "$ip/", headers: {}));
    String url = 'users/$userId/lemons';

    dio.interceptors.add(CustomInterceptor(storage: storage));

    try {
      final response = await dio.get(url);

      var result = response.data;

      UserLemonModel lemonResult = UserLemonModel.fromJson(result);

      return lemonResult;
    } on DioException catch (error) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
