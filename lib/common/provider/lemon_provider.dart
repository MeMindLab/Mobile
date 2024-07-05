import 'package:flutter_riverpod/flutter_riverpod.dart';

final lemonStateNotifierProvider =
    StateNotifierProvider<LemonStateNotifier, int>((ref) {
  final notifier = LemonStateNotifier();
  return notifier;
});

class LemonStateNotifier extends StateNotifier<int> {
  LemonStateNotifier() : super(0) {
    lemonInit();
  }

  Future<void> lemonInit() async {
    state = 0;
  }

  Future<void> lemonIncrease() async {
    state += 5;
  }
}
