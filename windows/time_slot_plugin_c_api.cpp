#include "include/time_slot_plugin/time_slot_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "time_slot_plugin.h"

void TimeSlotPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  time_slot_plugin::TimeSlotPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
