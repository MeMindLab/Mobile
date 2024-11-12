import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:me_mind/settings/view/s_setting_theme.dart';

final themeProvider = StateNotifierProvider<ThemeNotifier, AppTheme>((ref) {
  return ThemeNotifier();
});

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme.basic);

  void setTheme(AppTheme theme) {
    state = theme;
  }
}
