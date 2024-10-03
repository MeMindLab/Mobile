import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:me_mind/common/provider/lemon_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';
import 'package:me_mind/report/model/create_daily/create_daily_model.dart';
import 'package:me_mind/report/services/daily_service.dart';

final reportCreateProvider =
    StateNotifierProvider<ReportCreateStateNotifier, ReportCreateBase>((ref) {
  final notifier = ReportCreateStateNotifier(ref);

  return notifier;
});

class ReportCreateStateNotifier extends StateNotifier<ReportCreateBase> {
  final StateNotifierProviderRef<ReportCreateStateNotifier, ReportCreateBase>
      ref;

  ReportCreateStateNotifier(this.ref) : super(ReportCreateAwaiting());

  Future create({required String uuid}) async {
    // 발급 과정

    try {
      state = ReportCreateLoading(stateMsg: "레포트를 생성중입니다.");

      final report = await DailyService().create(id: uuid);
      if (report is! CreateDailyModel) return;

      state = ReportCreateLoading(stateMsg: "레몬을 1 감소합니다.");
      await ref.read(lemonStateNotifierProvider.notifier).lemonInit();

      // ref.read(provider.notifier).state = report.reportId;

      // print(ref.watch(reportIdProvider));

      Future.delayed(const Duration(seconds: 2), () {
        state = ReportCreateSuccess(stateMsg: "레포트 발급에 성공했습니다.");
      });
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
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReportCreateLoading && other.stateMsg == stateMsg;
  }

  @override
  int get hashCode => stateMsg.hashCode;
}

class ReportLemonLoading extends ReportCreateBase {
  String stateMsg;

  ReportLemonLoading({
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
