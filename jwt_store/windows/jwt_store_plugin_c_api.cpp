#include "include/jwt_store/jwt_store_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "jwt_store_plugin.h"

void JwtStorePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  jwt_store::JwtStorePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
