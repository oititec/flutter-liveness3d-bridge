import './platform_interface.dart';

class OitiLiveness3d {
  static Future startLiveness3d(
    String appKey,
    bool isProd,
  ) async {
    final result =
        await OitiLiveness3dPlatform.instance.startLiveness3d(appKey, isProd);

    return LivenessSuccessResult(
      result['valid'] ?? false,
      result['cause'] ?? '',
      result['codId'] ?? '',
      result['protocol'] ?? '',
      result['scanResultBlob'] ?? '',
    );
  }
}

class LivenessSuccessResult {
  final bool valid;
  final String cause;
  final String codId;
  final String protocol;
  final String scanResultBlob;

  LivenessSuccessResult(
    this.valid,
    this.cause,
    this.codId,
    this.protocol,
    this.scanResultBlob,
  );
}
