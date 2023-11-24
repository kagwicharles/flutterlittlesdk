import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutterlittlesdk_method_channel.dart';

abstract class FlutterlittlesdkPlatform extends PlatformInterface {
  /// Constructs a FlutterlittlesdkPlatform.
  FlutterlittlesdkPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterlittlesdkPlatform _instance = MethodChannelFlutterlittlesdk();

  /// The default instance of [FlutterlittlesdkPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterlittlesdk].
  static FlutterlittlesdkPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterlittlesdkPlatform] when
  /// they register themselves.
  static set instance(FlutterlittlesdkPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
