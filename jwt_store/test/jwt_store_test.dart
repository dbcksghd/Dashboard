import 'package:flutter_test/flutter_test.dart';
import 'package:jwt_store/jwt_store.dart';
import 'package:jwt_store/jwt_store_platform_interface.dart';
import 'package:jwt_store/jwt_store_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJwtStorePlatform
    with MockPlatformInterfaceMixin
    implements JwtStorePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JwtStorePlatform initialPlatform = JwtStorePlatform.instance;

  test('$MethodChannelJwtStore is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJwtStore>());
  });

  test('getPlatformVersion', () async {
    JwtStore jwtStorePlugin = JwtStore();
    MockJwtStorePlatform fakePlatform = MockJwtStorePlatform();
    JwtStorePlatform.instance = fakePlatform;

    expect(await jwtStorePlugin.getPlatformVersion(), '42');
  });
}
