//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <time_slot_plugin/time_slot_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) time_slot_plugin_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "TimeSlotPlugin");
  time_slot_plugin_register_with_registrar(time_slot_plugin_registrar);
}
