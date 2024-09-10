import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/user/model/sign_up_agree.dart';

final agreeStateNotifierProvider =
    StateNotifierProvider<AgreeStateNotifier, SignUpAgree>(
        (ref) => AgreeStateNotifier());

class AgreeStateNotifier extends StateNotifier<SignUpAgree> {
  AgreeStateNotifier()
      : super(SignUpAgree(
            isSubmitted: false,
            isAll: false,
            isService: false,
            isPersonalInfo: false,
            isAppPush: false,
            isAdvertising: false));

  updateAll({required bool isTrue}) {
    print(isTrue);
    final updateState = state.copyWith(
        isSubmitted: isTrue,
        isAll: isTrue,
        isService: isTrue,
        isPersonalInfo: isTrue,
        isAppPush: isTrue,
        isAdvertising: isTrue);
    state = updateState;
  }
}
