#include "include/network_module/network_module_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "network_module_plugin.h"

void NetworkModulePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  network_module::NetworkModulePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
