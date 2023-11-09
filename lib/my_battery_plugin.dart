import 'my_battery_plugin_platform_interface.dart';

class MyBatteryPlugin {
  Future<int> getBatteryLevel() async {
    return MyBatteryPluginPlatform.instance.getBatteryLevel();
  }

  Future<String?> getPlatformVersion() {
    return MyBatteryPluginPlatform.instance.getPlatformVersion();
  }
}
