import './platform_interface.dart';

class OitiLiveness3d {
  static Future startLiveness3d(
    String appKey,
    bool isProd,
  ) async {
    return await OitiLiveness3dPlatform.instance
        .startLiveness3d(appKey, isProd);
  }
}
