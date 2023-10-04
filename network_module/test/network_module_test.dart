import 'package:flutter_test/flutter_test.dart';
import 'package:network_module/network_module.dart';
import 'package:network_module/network_module_platform_interface.dart';
import 'package:network_module/network_module_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNetworkModulePlatform
    with MockPlatformInterfaceMixin
    implements NetworkModulePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NetworkModulePlatform initialPlatform = NetworkModulePlatform.instance;

  test('$MethodChannelNetworkModule is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNetworkModule>());
  });

  test('getPlatformVersion', () async {
    NetworkModule networkModulePlugin = NetworkModule();
    MockNetworkModulePlatform fakePlatform = MockNetworkModulePlatform();
    NetworkModulePlatform.instance = fakePlatform;

    expect(await networkModulePlugin.getPlatformVersion(), '42');
  });
}
