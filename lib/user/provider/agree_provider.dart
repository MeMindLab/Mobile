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
    final updateState = state.copyWith(
        isSubmitted: isTrue,
        isAll: isTrue,
        isService: isTrue,
        isPersonalInfo: isTrue,
        isAppPush: isTrue,
        isAdvertising: isTrue);
    state = updateState;
  }

  updateService({required bool isTrue}) {
    final updateState = state.copyWith(
        isService: isTrue,
        isSubmitted: isTrue && state.isPersonalInfo ? true : false,
        isAll: isTrue &&
                state.isPersonalInfo &&
                state.isAppPush &&
                state.isAdvertising
            ? true
            : false);
    state = updateState;
  }

  updatePersonal({required bool isTrue}) {
    final updateState = state.copyWith(
        isPersonalInfo: isTrue,
        isSubmitted: state.isService && isTrue ? true : false,
        isAll:
            state.isService && isTrue && state.isAppPush && state.isAdvertising
                ? true
                : false);
    state = updateState;
  }

  updateAppPush({required bool isTrue}) {
    final updateState = state.copyWith(
        isAppPush: isTrue,
        isAll: state.isService &&
                state.isPersonalInfo &&
                isTrue &&
                state.isAdvertising
            ? true
            : false);
    state = updateState;
  }

  updateAdverTising({required bool isTrue}) {
    final updateState = state.copyWith(
        isAdvertising: isTrue,
        isAll:
            state.isService && state.isPersonalInfo && state.isAppPush && isTrue
                ? true
                : false);
    state = updateState;
  }
}
