import 'package:flutter/services.dart';

class BatteryImpl {
  static const platform = MethodChannel('com.example.battery/methods');

  Future<String> getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel ?? '';
  }
}
