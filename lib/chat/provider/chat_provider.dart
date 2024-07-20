import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/model/chat_start_model.dart';
import 'package:me_mind/chat/provider/chat_id_provider.dart';
import 'package:me_mind/chat/services/chat_send_service.dart';
import 'package:me_mind/chat/services/chat_start_service.dart';

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

    newState.insert(
        0,
        ChatMessageModel(
            message: message, index: 10, is_ai: false, is_image: false));

    state = [...newState];

    newState.insert(0, ChatMessageLoading());
    state = [...newState];

    try {
      AiAnswerModel answer = await ChatSendService().send(message, idProvider);

      int answerCnt = 0;
      String displayAnswer = "";

      Timer.periodic(const Duration(milliseconds: 80), (timer) {
        if (answerCnt >= answer.result.answer.length - 2) {
          timer.cancel();
        } else {
          displayAnswer += answer.result.answer[answerCnt];
          newState[0] = ChatMessageModel(
              index: 11, message: displayAnswer, is_ai: true, is_image: false);

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
        var response = await ChatStartService().load("2024-07-20");

        if (response is ChatStartModel) {
          idProvider = response.conversationId;

          state = response.chatHistory.map((e) {
            return ChatMessageModel.fromJson({
              "message": e.message,
              "index": 5,
              "is_ai": !e.isFromUser,
              "is_image": false
            });
          }).toList();
        } else {}
        // state = [
        //   {
        //     "message": "안녕하세요. 구르미에요 :)",
        //     "index": 1,
        //     "is_ai": true,
        //     "is_image": false
        //   },
        //   {
        //     "message": "오늘 하루 있었던 일이나 느낀 감정을 이야기해주세요.구르미가 모두 들어줄게요!",
        //     "index": 1,
        //     "is_ai": true,
        //     "is_image": false
        //   },
        //   {
        //     "message": "오늘도 힘들었어ㅠㅠㅠ",
        //     "index": 2,
        //     "is_ai": false,
        //     "is_image": false
        //   },
        //   {
        //     "message": "오늘 많이 지치고 힘들었던 날이군요ㅠㅠ 어떤 일들이 힘들었는지 얘기해줄 수 있어요?",
        //     "index": 3,
        //     "is_ai": true,
        //     "is_image": false
        //   },
        //   {
        //     "message":
        //         "https://cdn.wadiz.kr/ft/images/green001/2020/1008/20201008002546462_1.gif",
        //     "index": 4,
        //     "is_ai": false,
        //     "is_image": true
        //   },
        //   {
        //     "message": "오늘 많이 지치고 힘들었던 날이군요ㅠㅠ 어떤 일들이 힘들었는지 얘기해줄 수 있어요?",
        //     "index": 5,
        //     "is_ai": true,
        //     "is_image": false
        //   },
        // ].reversed.map((e) => ChatMessageModel.fromJson(e)).toList();
      }
    } catch (e) {
      throw Error();
    }
  }
}
