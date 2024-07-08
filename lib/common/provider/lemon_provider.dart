import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/common/model/user_lemon_patch_model.dart';
import 'package:me_mind/common/provider/user_provider.dart';
import 'package:me_mind/common/services/lemon_service.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final notifier = LemonStateNotifier(ref);

  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  final StateNotifierProviderRef<LemonStateNotifier, int> ref;
  LemonStateNotifier(this.ref) : super(0) {
    lemonInit(lemon: 0);
  }

  Future<void> lemonInit({required int lemon}) async {
    state = lemon;
  }

  Future<void> lemonIncrease() async {
    try {
      final userId = ref.watch(userIdProvider);
      final response =
          await LemonService().patchLemon(userId: userId, count: state + 5);

      if (response is UserLemonPatchModel) {
        state = response.lemonCount;
        print(response);
      }
    } catch (e) {
      return null;
    }
  }
}
