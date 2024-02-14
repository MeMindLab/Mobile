import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  Future accessNotification() async {
    var requestStatus = await Permission.notification.request();
    var status = await Permission.notification.status;

    // print("request $requestStatus");
    // print("status : $status");

    if (status == PermissionStatus.denied) {
      print("권한 요청 거절");
      // var result = await Permission.notification.request();
      // return result;
    } else if (status == PermissionStatus.permanentlyDenied ||
        requestStatus == PermissionStatus.permanentlyDenied) {
      // 권한 영구적 거부
      openAppSettings();
    } else if (status.isRestricted) {
      openAppSettings();
    }
    return status;
  }
}
