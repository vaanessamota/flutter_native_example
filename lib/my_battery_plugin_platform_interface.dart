import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_battery_plugin_method_channel.dart';

abstract class MyBatteryPluginPlatform extends PlatformInterface {
  /// Constructs a MyBatteryPluginPlatform.
  MyBatteryPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyBatteryPluginPlatform _instance = MethodChannelMyBatteryPlugin();

  /// The default instance of [MyBatteryPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyBatteryPlugin].
  static MyBatteryPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyBatteryPluginPlatform] when
  /// they register themselves.
  static set instance(MyBatteryPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<int> getBatteryLevel() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
