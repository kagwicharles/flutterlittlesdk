import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutterlittlesdk_platform_interface.dart';

/// An implementation of [FlutterlittlesdkPlatform] that uses method channels.
class MethodChannelFlutterlittlesdk extends FlutterlittlesdkPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutterlittlesdk');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
