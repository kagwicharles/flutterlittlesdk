import 'package:flutter/services.dart';

import 'flutterlittlesdk_platform_interface.dart';

class Flutterlittlesdk {
  static const MethodChannel _channel =
      MethodChannel('com.craftsilicon.littlesdkchannelhelper');

  Future<String?> getPlatformVersion() {
    return FlutterlittlesdkPlatform.instance.getPlatformVersion();
  }

  static Future<void> invokeMethod(String littleProduct) async {
    await _channel.invokeMethod('getLittleProduct', <String, dynamic>{
      'littleProduct': littleProduct,
    });
  }
}
