import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final notifier = LemonStateNotifier(ref);

  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  final StateNotifierProviderRef<LemonStateNotifier, int> ref;

  LemonStateNotifier(this.ref) : super(0) {
    lemonInit();
  }

  Future<void> lemonInit() async {
    try {
      final user = await UserInfoService().findUser();

      final response = await LemonService().getLemon(userId: user.id);
      if (response is! UserLemonModel) return;

      state = response.lemonCount;
    } catch (e) {
      state = 0;
    }
  }
}
