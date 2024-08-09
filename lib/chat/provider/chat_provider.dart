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
import 'package:intl/intl.dart';

final chatStateNotifierProvider =
    StateNotifierProvider<ChatStateNotifier, List>((ref) {
  final idProvider = ref.watch(chatIdProvider);
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
  String idProvider;
  StateController<bool> reportIssue;

  Future<void> addChating(
      {required String message, bool isImage = false}) async {
    if (idProvider == "") return;

    final newState = [...state];

    String msgTime = chatAddDateTimeType(null);
    newState.insert(
        0,
        ChatMessageModel(
            message: message,
            index: newState[0].index + 1,
            is_ai: false,
            is_image: isImage,
            createdAt: msgTime));

    state = [...newState];

    newState.insert(0, ChatMessageLoading());
    state = [...newState];

    try {
      AiAnswerModel answer = await ChatSendService().send(message, idProvider);
      reportIssue.state = answer.result.isEnough;

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
        var response = await chatStartService.load(datetimeType3());

        if (response is ChatStartModel) {
          idProvider = response.conversationId;
          reportIssue.state = response.isEnough;
          print("${reportIssue.state} ${response.isEnough}");

          state = response.chatHistory.reversed.map((e) {
            // String msgTime = chatAddDateTimeType(e.messageTimestamp);
            String msgTime = chatAddDateTimeType(
                DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()));
            bool isImage = false;
            if (e.message.length > 6) {
              isImage = e.message.substring(0, 5) == "https" ? true : false;
            }

            return ChatMessageModel.fromJson({
              "message": e.message,
              "index": e.index,
              "is_ai": !e.isFromUser,
              "is_image": isImage,
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
