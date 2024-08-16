import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';

class ChatSendService {
  Future send(String answer, String conversationId,
      {String imageUrl = ""}) async {
    const url = "http://10.0.2.2:8000/chat/answer";
    final data = {
      "conversation_id": conversationId,
      "message": answer,
      "image_url": imageUrl,
      "is_image": false
    };
    print("이미지 보내는 겁니다. $data");

    final dio = Dio();
    Response response;

    try {
      response = await dio.post(url, data: data);

      var result = response.data;

      AiAnswerModel answer = AiAnswerModel.fromJson(result);

      return answer;
    } on DioException catch (error) {
      return error;
    } catch (e) {
      return null;
    }
  }
}
