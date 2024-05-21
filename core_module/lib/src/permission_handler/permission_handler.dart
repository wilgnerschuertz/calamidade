import 'package:permission_handler/permission_handler.dart';

class PermissionHandler {
  Future<bool> location() async {
    final status = await Permission.location.status;

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      final result = await Permission.location.request();

      if (result.isGranted) {
        return true;
      } else if (result.isPermanentlyDenied) {
        return await openAppSettings();
      }
    } else if (status.isPermanentlyDenied) {
      return await openAppSettings();
    }
    return false;
  }
}
