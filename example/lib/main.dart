import 'package:flutter/material.dart';
import 'package:my_battery_plugin/my_battery_plugin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _batteryLevel = -1;

  @override
  void initState() {
    super.initState();
    _getBatteryLevel();
  }

  void _getBatteryLevel() async {
    MyBatteryPlugin myBatteryPlugin = MyBatteryPlugin();

    int batteryLevel = await myBatteryPlugin.getBatteryLevel();
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Battery Level Example'),
        ),
        body: Center(
          child: Text('Battery Level: $_batteryLevel%'),
        ),
      ),
    );
  }
}
