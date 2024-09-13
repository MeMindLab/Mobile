import 'package:dio/dio.dart';
import 'package:me_mind/common/constant/constant.dart';
import 'package:me_mind/common/dio/dio.dart';
import 'package:me_mind/settings/model/user_validation_model.dart';

class UserValidationService {
  Future checkEmail({required String email}) async {
    final dio = Dio();

    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});
    String url = "$ip/users/emails/validation?email=$email";

    try {
      final response = await dio.get(url);

      UserValidationModel result = UserValidationModel.fromJson(response.data);

      return result;
    } on DioException catch (error) {
      return null;
    } catch (e) {
      return null;
    }
  }

  Future checkName({required String name}) async {
    final dio = Dio();

    dio.interceptors.add(CustomInterceptor(storage: storage));
    dio.options.headers.clear();
    dio.options.headers.addAll({'accessToken': true});
    String url = "$ip/users/nickname/validation?nickname=$name";

    try {
      final response = await dio.get(url);

      UserValidationModel result = UserValidationModel.fromJson(response.data);

      return result;
    } on DioException catch (error) {
      return null;
    } catch (e) {
      return null;
    }
  }
}
