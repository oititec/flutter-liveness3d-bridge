import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import './platform_interface.dart';

class MethodChannelOitiLiveness3d extends OitiLiveness3dPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('oiti_liveness3d');

  @override
  Future startLiveness(
    String appKey,
    bool isProd,
  ) async {
    return await methodChannel.invokeMapMethod(
      'OITI.startLiveness3d',
      {
        'appkey': appKey,
        'isProd': isProd,
      },
    );
  }
}
