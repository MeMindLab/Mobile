import 'package:shared_preferences/shared_preferences.dart';

Future<void> setBottomIdx(int idx) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('bottomIdx', idx);
}

Future<int?> getBottomIdx() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getInt('bottomIdx');
}