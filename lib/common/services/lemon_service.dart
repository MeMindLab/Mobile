import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/model/user_lemon_patch_model.dart';

class LemonService {
  // 레몬 생성 api 삭제
  Future patchLemon({required String userId, required int count}) async {
    final dio = Dio();
    final data = {"lemon_count": count};

    try {
      final response = await dio
          .patch("http://10.0.2.2:8000/users/$userId/lemon", data: data);

      var result = response.data;

      UserLemonPatchModel model = UserLemonPatchModel.fromJson(result);

      return model;
    } on DioException catch (error) {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future getLemon({required String userId}) async {
    final dio = Dio(BaseOptions(baseUrl: "http://10.0.2.2:8000/", headers: {}));

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
