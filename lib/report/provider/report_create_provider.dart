import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/report/model/create_daily/create_daily_model.dart';
import 'package:me_mind/report/services/daily_service.dart';

final reportCreateProvider =
    StateNotifierProvider<ReportCreateStateNotifier, ReportCreateBase>((ref) {
  final notifier = ReportCreateStateNotifier();
  return notifier;
});

class ReportCreateStateNotifier extends StateNotifier<ReportCreateBase> {
  ReportCreateStateNotifier() : super(ReportCreateAwaiting());

  Future create({required String uuid}) async {
    // 발급 과정

    try {
      state = ReportCreateLoading(stateMsg: "레포트를 생성중입니다.");

      final report = await DailyService().create(id: uuid);
      if (report is! CreateDailyModel) return;
      // 레몬 1감소 실행
      // 레포트 발급 성공
      state = ReportCreateSuccess(stateMsg: "레포트 발급에 성공했습니다.");
    } catch (e) {
      state = ReportCreateFailed(stateMsg: "레포트 발급에 실패했습니다.");
      print(e);
    }
  }
}

abstract class ReportCreateBase {}

class ReportCreateAwaiting extends ReportCreateBase {}

class ReportCreateLoading extends ReportCreateBase {
  String stateMsg;

  ReportCreateLoading({
    required this.stateMsg,
  });
}

class ReportCreateFailed extends ReportCreateBase {
  String stateMsg;
  ReportCreateFailed({
    required this.stateMsg,
  });
}

class ReportCreateSuccess extends ReportCreateBase {
  String stateMsg;

  ReportCreateSuccess({
    required this.stateMsg,
  });
}
