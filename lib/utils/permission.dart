import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  void accessNotification() async {
    var status = await Permission.notification.status;
    print(status);
    if (status == PermissionStatus.denied) {
      var result = await Permission.notification.request();
    }
  }
}
