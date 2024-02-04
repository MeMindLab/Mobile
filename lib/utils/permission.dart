import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  Future accessNotification() async {
    var status = await Permission.notification.status;
    status = PermissionStatus.denied;
    print(status);
    if (status == PermissionStatus.denied) {
      var result = await Permission.notification.request();
      return result;
    }
    return status;
  }
}
