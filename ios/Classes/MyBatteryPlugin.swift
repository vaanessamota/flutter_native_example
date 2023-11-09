import Flutter

public class MyBatteryPlugin: NSObject, FlutterPlugin {
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "my_battery_plugin", binaryMessenger: registrar.messenger())
        let instance = MyBatteryPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "getBatteryLevel" {
            let batteryLevel = getBatteryLevel()
            result(batteryLevel)
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func getBatteryLevel() -> Int {
        let device = UIDevice.current
        device.isBatteryMonitoringEnabled = true

        if device.batteryState == .unplugged {
            return Int(device.batteryLevel * 100)
        } else {
            // The device is plugged in, so return -1 to indicate that it's charging.
            return -1
        }
    }
}
