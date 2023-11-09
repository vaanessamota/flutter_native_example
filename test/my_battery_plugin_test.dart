import 'package:flutter_test/flutter_test.dart';
import 'package:my_battery_plugin/my_battery_plugin.dart';
import 'package:my_battery_plugin/my_battery_plugin_platform_interface.dart';
import 'package:my_battery_plugin/my_battery_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyBatteryPluginPlatform with MockPlatformInterfaceMixin implements MyBatteryPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<int> getBatteryLevel() => Future.value(42);
}

void main() {
  final MyBatteryPluginPlatform initialPlatform = MyBatteryPluginPlatform.instance;

  test('$MethodChannelMyBatteryPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyBatteryPlugin>());
  });

  test('getPlatformVersion', () async {
    MyBatteryPlugin myBatteryPlugin = MyBatteryPlugin();
    MockMyBatteryPluginPlatform fakePlatform = MockMyBatteryPluginPlatform();
    MyBatteryPluginPlatform.instance = fakePlatform;

    expect(await myBatteryPlugin.getPlatformVersion(), '42');
  });
}
