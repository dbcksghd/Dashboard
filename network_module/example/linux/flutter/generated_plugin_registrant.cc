//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_secure_storage_linux/flutter_secure_storage_linux_plugin.h>
#include <jwt_store/jwt_store_plugin.h>
#include <network_module/network_module_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) flutter_secure_storage_linux_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "FlutterSecureStorageLinuxPlugin");
  flutter_secure_storage_linux_plugin_register_with_registrar(flutter_secure_storage_linux_registrar);
  g_autoptr(FlPluginRegistrar) jwt_store_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "JwtStorePlugin");
  jwt_store_plugin_register_with_registrar(jwt_store_registrar);
  g_autoptr(FlPluginRegistrar) network_module_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NetworkModulePlugin");
  network_module_plugin_register_with_registrar(network_module_registrar);
}
