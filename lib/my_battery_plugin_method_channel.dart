import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_battery_plugin_platform_interface.dart';

/// An implementation of [MyBatteryPluginPlatform] that uses method channels.
class MethodChannelMyBatteryPlugin extends MyBatteryPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_battery_plugin');

  @override
  Future<int> getBatteryLevel() async {
    final int batteryLevel = await methodChannel.invokeMethod('getBatteryLevel');
    return batteryLevel;
  }

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
