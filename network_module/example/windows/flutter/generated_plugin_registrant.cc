//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <flutter_secure_storage_windows/flutter_secure_storage_windows_plugin.h>
#include <jwt_store/jwt_store_plugin_c_api.h>
#include <network_module/network_module_plugin_c_api.h>

void RegisterPlugins(flutter::PluginRegistry* registry) {
  FlutterSecureStorageWindowsPluginRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("FlutterSecureStorageWindowsPlugin"));
  JwtStorePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("JwtStorePluginCApi"));
  NetworkModulePluginCApiRegisterWithRegistrar(
      registry->GetRegistrarForPlugin("NetworkModulePluginCApi"));
}
