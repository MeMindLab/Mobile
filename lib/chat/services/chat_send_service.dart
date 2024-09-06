import 'package:dio/dio.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';
import 'package:me_mind/common/constant/constant.dart';

class ChatSendService {
  Future send(String answer, String conversationId,
      {String imageUrl = "", bool isImage = false}) async {
    final url = "http://$ip/chat/answer";
    final data = {
      "conversation_id": conversationId,
      "message": answer,
      "image_url": imageUrl,
      "is_image": isImage
    };

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
