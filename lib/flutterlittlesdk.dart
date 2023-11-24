
import 'flutterlittlesdk_platform_interface.dart';

class Flutterlittlesdk {
  Future<String?> getPlatformVersion() {
    return FlutterlittlesdkPlatform.instance.getPlatformVersion();
  }
}
