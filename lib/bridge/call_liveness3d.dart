import './platform_interface.dart';

class OitiLiveness3d {
  static Future startLiveness(
    String appKey,
    bool isProd,
  ) async {
    return await OitiLiveness3dPlatform.instance.startLiveness(appKey, isProd);
  }
}
