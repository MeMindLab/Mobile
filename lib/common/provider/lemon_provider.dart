import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/model/user_lemon_model.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';
import 'package:me_mind/settings/model/user_info_model.dart';
import 'package:me_mind/settings/services/userinfo_service.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final userInfo = ref.watch(userStateNotifierProvider);
  final notifier = LemonStateNotifier(userInfo, ref);

  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  final UserDetailModel userInfo;
  final StateNotifierProviderRef<LemonStateNotifier, int> ref;

  LemonStateNotifier(this.userInfo, this.ref) : super(0) {
    lemonInit();
  }

  Future<void> lemonInit() async {
    try {
      if (userInfo.userId == null || userInfo.userId == "") {
        final user = await UserInfoService().findUser();
        print("userID:${user.id}");
        final response = await LemonService().getLemon(userId: user.id);

        if (mounted) {
          state = response.lemonCount;
        }

        return;
      }
      final response = await LemonService().getLemon(userId: userInfo.userId!);
      if (response is! UserLemonModel) return;

      if (mounted) {
        state = response.lemonCount;
      }
    } catch (e) {
      state = 0;
    }
  }
}
