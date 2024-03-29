#ifndef FLUTTER_PLUGIN_JWT_STORE_PLUGIN_H_
#define FLUTTER_PLUGIN_JWT_STORE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace jwt_store {

class JwtStorePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  JwtStorePlugin();

  virtual ~JwtStorePlugin();

  // Disallow copy and assign.
  JwtStorePlugin(const JwtStorePlugin&) = delete;
  JwtStorePlugin& operator=(const JwtStorePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace jwt_store

#endif  // FLUTTER_PLUGIN_JWT_STORE_PLUGIN_H_
