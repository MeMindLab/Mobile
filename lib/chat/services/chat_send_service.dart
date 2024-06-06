import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';

class ChatSendService {
  Future send(String answer) async {
    const url = "http://10.0.2.2:8000/chat/answer";
    final data = {
      "conversation_id": "string",
      "message": "string",
      "image_url": "string",
      "is_image": true
    };

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);

      if (response.statusCode == 200) {
        var result = response.data;

        AiAnswerModel answer = AiAnswerModel.fromJson(result);

        return answer;
      } else {
        return null;
      }
    } on DioException catch (error) {
      return error;
    } catch (e) {
      return null;
    }
  }
}
