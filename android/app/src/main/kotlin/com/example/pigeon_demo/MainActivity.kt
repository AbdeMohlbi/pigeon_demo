package com.example.pigeon_demo

import android.os.BatteryManager
import android.os.Build
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        // Register our BatteryApi implementation
        BatteryApi.setUp(
            flutterEngine.dartExecutor.binaryMessenger,
            object : BatteryApi {
                override fun getBatteryLevel(): Long {
                    val batteryManager = getSystemService(BATTERY_SERVICE) as BatteryManager
                    return batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY).toLong()
                }
            },
        )
    }
}
