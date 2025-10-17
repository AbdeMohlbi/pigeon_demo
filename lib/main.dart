import 'package:flutter/material.dart';
import 'messages.g.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int? _batteryLevel;

  Future<void> _getBatteryLevel() async {
    final api = BatteryApi();
    final level = await api.getBatteryLevel();
    setState(() => _batteryLevel = level);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Pigeon Battery Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _batteryLevel == null
                    ? 'Press the button to get battery level'
                    : 'Battery Level: $_batteryLevel%',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _getBatteryLevel,
                child: const Text('Get Battery Level'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
