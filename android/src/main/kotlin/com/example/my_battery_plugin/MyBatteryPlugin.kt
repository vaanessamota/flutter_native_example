package com.example.my_battery_plugin

import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class MyBatteryPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var applicationContext: Context
  private lateinit var methodChannel: MethodChannel

  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    applicationContext = binding.applicationContext
    methodChannel = MethodChannel(binding.binaryMessenger, "my_battery_plugin")
    methodChannel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getBatteryLevel") {
      val batteryLevel = getBatteryLevel()
      result.success(batteryLevel)
    } else {
      result.notImplemented()
    }
  }

  private fun getBatteryLevel(): Int {
    val batteryIntent = applicationContext.registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
    val level = batteryIntent?.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) ?: -1
    val scale = batteryIntent?.getIntExtra(BatteryManager.EXTRA_SCALE, -1) ?: -1

    return if (level != -1 && scale != -1) {
      (level / scale.toFloat() * 100).toInt()
    } else {
      -1 // Return -1 if the battery level couldn't be retrieved.
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    methodChannel.setMethodCallHandler(null)
  }
}
