import 'dart:io';

class AdMobService {
  static String? get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-6226753002068195/2344321298';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-6226753002068195/2344321298';
    }
    return null;
  }
}
