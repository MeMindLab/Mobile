import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/model/chat_start_model.dart';
import 'package:me_mind/chat/provider/chat_id_provider.dart';
import 'package:me_mind/chat/services/chat_send_service.dart';
import 'package:me_mind/chat/services/chat_start_service.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';

final chatStateNotifierProvider =
    StateNotifierProvider<ChatStateNotifier, List>((ref) {
  final idProvider = ref.watch(chatIdProvider);
  return ChatStateNotifier(idProvider);
});

class ChatStateNotifier extends StateNotifier<List> {
  ChatStateNotifier(this.idProvider) : super([]) {
    loading();
  }

  String idProvider;

  Future<void> addChating({required String message}) async {
    if (idProvider == "") return;

    final newState = [...state];

    String msgTime = chatAddDateTimeType(null);
    newState.insert(
        0,
        ChatMessageModel(
            message: message,
            index: newState[0].index + 1,
            is_ai: false,
            is_image: false,
            createdAt: msgTime));

    state = [...newState];

    newState.insert(0, ChatMessageLoading());
    state = [...newState];

    try {
      AiAnswerModel answer = await ChatSendService().send(message, idProvider);

      int answerCnt = 0;
      String displayAnswer = "";

      Timer.periodic(const Duration(milliseconds: 80), (timer) {
        if (answerCnt >= answer.result.message.length - 1) {
          timer.cancel();
        } else {
          displayAnswer += answer.result.message[answerCnt];
          newState[0] = ChatMessageModel(
              index: newState[1].index + 1,
              message: displayAnswer,
              is_ai: true,
              is_image: false,
              createdAt: msgTime);

          state = [...newState];
          answerCnt++;
        }
      });
    } catch (e) {
      newState[0] = ChatMessageError();
    }
    state = [...newState];
  }

  Future<void> loading() async {
    try {
      if (state.isEmpty) {
        var response = await ChatStartService().load(datetimeType3());

        if (response is ChatStartModel) {
          idProvider = response.conversationId;

          state = response.chatHistory.reversed.map((e) {
            String msgTime = chatAddDateTimeType(e.messageTimestamp);

            return ChatMessageModel.fromJson({
              "message": e.message,
              "index": e.index,
              "is_ai": !e.isFromUser,
              "is_image": false,
              "createdAt": msgTime,
            });
          }).toList();
        } else {}
      }
    } catch (e) {
      throw Error();
    }
  }
}
