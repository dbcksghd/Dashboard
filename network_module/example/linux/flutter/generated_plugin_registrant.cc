//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <network_module/network_module_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) network_module_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "NetworkModulePlugin");
  network_module_plugin_register_with_registrar(network_module_registrar);
}
