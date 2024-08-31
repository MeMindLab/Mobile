import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/chat/model/ai_answer_model.dart';
import 'package:me_mind/chat/model/chat_message_model.dart';
import 'package:me_mind/chat/model/chat_start_model.dart';
import 'package:me_mind/chat/provider/chat_id_provider.dart';
import 'package:me_mind/chat/provider/report_issue_provider.dart';
import 'package:me_mind/chat/services/chat_send_service.dart';
import 'package:me_mind/chat/services/chat_start_service.dart';
import 'package:me_mind/common/component/datetime_to_text.dart';

final chatStateNotifierProvider =
    StateNotifierProvider<ChatStateNotifier, List>((ref) {
  final idProvider = ref.watch(chatIdProvider.notifier);
  final reportIssue = ref.watch(reportIssueProvider.notifier);
  final chatStart = ref.watch(chatStartServiceProvider);
  return ChatStateNotifier(idProvider, reportIssue,
      chatStartService: chatStart);
});

class ChatStateNotifier extends StateNotifier<List> {
  ChatStateNotifier(this.idProvider, this.reportIssue,
      {required this.chatStartService})
      : super([]) {
    loading();
  }

  final ChatStartService chatStartService;
  StateController<String> idProvider;
  StateController<bool> reportIssue;

  Future<void> addChating(
      {required String message, bool isImage = false}) async {
    if (idProvider == "") return;

    final newState = [...state];

    String msgTime = chatAddDateTimeType(null);

    state = [...newState];
    if (isImage == false) {
      newState.insert(
          0,
          ChatMessageModel(
              message: message,
              index: newState[0].index + 1,
              isAi: false,
              isImage: isImage,
              createdAt: msgTime));
      newState.insert(0, ChatMessageLoading());
      state = [...newState];
    }

    try {
      AiAnswerModel answer = isImage
          ? await ChatSendService()
              .send("", idProvider.state, imageUrl: message, isImage: true)
          : await ChatSendService().send(message, idProvider.state);
      reportIssue.state = answer.result.isEnough;

      if (isImage == false) {
        int answerCnt = 0;

        List answerBox = answer.result.message.runes.toList();

        answer.result.message.runes;
        String displayAnswer = "";

        Timer.periodic(const Duration(milliseconds: 80), (timer) {
          if (answerCnt >= answerBox.length - 1) {
            timer.cancel();
          } else {
            displayAnswer += String.fromCharCode(answerBox[answerCnt]);
            newState[0] = ChatMessageModel(
                index: newState[1].index + 1,
                message: displayAnswer,
                isAi: true,
                isImage: false,
                createdAt: msgTime);

            state = [...newState];
            answerCnt++;
          }
        });
      } else {
        newState.insert(
            0,
            ChatMessageModel(
                message: message,
                index: newState[0].index + 1,
                isAi: false,
                isImage: isImage,
                createdAt: msgTime));
        state = [...newState];
      }
    } catch (e) {
      newState[0] = ChatMessageError();
    }
    state = [...newState];
  }

  Future<void> loading() async {
    try {
      if (state.isEmpty) {
        var response = await chatStartService.load(datetimeType3());

        if (response is ChatStartModel) {
          idProvider.state = response.conversationId;
          reportIssue.state = response.isEnough;

          state = response.chatHistory.reversed.map((e) {
            String msgTime = chatAddDateTimeType(e.messageTimestamp);

            return ChatMessageModel.fromJson({
              "message": e.message == "" ? e.imageUrl : e.message,
              "index": e.order,
              "isAi": !e.isFromUser,
              "isImage": e.imageUrl is String ? true : false,
              "createdAt": msgTime,
            });
          }).toList();
        } else {}
      }
    } catch (e) {
      print(e);
      throw Error();
    }
  }
}
