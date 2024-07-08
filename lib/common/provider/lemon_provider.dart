import 'package:flutter_riverpod/flutter_riverpod.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final notifier = LemonStateNotifier();
  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  LemonStateNotifier() : super(0) {
    lemonInit(lemon: 0);
  }

  Future<void> lemonInit({required int lemon}) async {
    state = lemon;
  }

  Future<void> lemonIncrease() async {
    state += 5;
  }
}
