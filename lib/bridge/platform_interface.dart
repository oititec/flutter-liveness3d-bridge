import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import './method_channel.dart';

abstract class OitiLiveness3dPlatform extends PlatformInterface {
  /// Constructs a OitiLiveness3dPlatform.
  OitiLiveness3dPlatform() : super(token: _token);

  static final Object _token = Object();

  static OitiLiveness3dPlatform _instance = MethodChannelOitiLiveness3d();

  static OitiLiveness3dPlatform get instance => _instance;

  static set instance(OitiLiveness3dPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future startLiveness3d(String appKey, bool isProd) {
    throw UnimplementedError('Liveness3D() has not been implemented.');
  }
}
