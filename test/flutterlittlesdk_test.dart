import 'package:flutter_test/flutter_test.dart';
import 'package:flutterlittlesdk/flutterlittlesdk.dart';
import 'package:flutterlittlesdk/flutterlittlesdk_platform_interface.dart';
import 'package:flutterlittlesdk/flutterlittlesdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterlittlesdkPlatform
    with MockPlatformInterfaceMixin
    implements FlutterlittlesdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterlittlesdkPlatform initialPlatform = FlutterlittlesdkPlatform.instance;

  test('$MethodChannelFlutterlittlesdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterlittlesdk>());
  });

  test('getPlatformVersion', () async {
    Flutterlittlesdk flutterlittlesdkPlugin = Flutterlittlesdk();
    MockFlutterlittlesdkPlatform fakePlatform = MockFlutterlittlesdkPlatform();
    FlutterlittlesdkPlatform.instance = fakePlatform;

    expect(await flutterlittlesdkPlugin.getPlatformVersion(), '42');
  });
}
