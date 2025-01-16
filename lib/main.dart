import 'package:battery/battery_impl.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String battery = '';

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    initPlatformState();
  }

  void initPlatformState() async {
    final battery = await BatteryImpl().getBatteryLevel();
    setState(() {
      this.battery = battery;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Battery level: $battery'),
        ),
      ),
    );
  }
}
