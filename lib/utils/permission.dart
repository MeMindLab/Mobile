import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class DevicePermission {
  Future accessNotification({required BuildContext context}) async {
    var requestStatus = await Permission.notification.request();
    var status = await Permission.notification.status;

    if (status == PermissionStatus.denied) {
      print("권한 요청 거절");
    } else if (status == PermissionStatus.permanentlyDenied ||
        requestStatus == PermissionStatus.permanentlyDenied) {
      openAppSettings();
    } else if (status.isRestricted) {
      openAppSettings();
    }
    return requestStatus;
  }
}
