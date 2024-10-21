import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final userInfo = ref.read(userStateNotifierProvider);
  final notifier = LemonStateNotifier(userInfo, ref);

  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  final UserDetailModel userInfo;
  final StateNotifierProviderRef<LemonStateNotifier, int> ref;

  LemonStateNotifier(this.userInfo, this.ref) : super(0) {}

  Future<void> lemonInit({required String userId}) async {
    if (!mounted) return;
    try {
      final response = await LemonService().getLemon(userId: userId);
      print(response);
      if (response is! UserLemonModel) return;

      state = response.lemonCount;
    } catch (e) {
      state = 0;
    }
  }

  Future<void> lemonLogout() async {
    state = 0;
    return;
  }
}
