#ifndef FLUTTER_PLUGIN_TIME_SLOT_PLUGIN_H_
#define FLUTTER_PLUGIN_TIME_SLOT_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace time_slot_plugin {

class TimeSlotPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  TimeSlotPlugin();

  virtual ~TimeSlotPlugin();

  // Disallow copy and assign.
  TimeSlotPlugin(const TimeSlotPlugin&) = delete;
  TimeSlotPlugin& operator=(const TimeSlotPlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace time_slot_plugin

#endif  // FLUTTER_PLUGIN_TIME_SLOT_PLUGIN_H_
