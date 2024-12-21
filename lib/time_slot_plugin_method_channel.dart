
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'time_slot_plugin_platform_interface.dart';

/// An implementation of [TimeSlotPluginPlatform] that uses method channels.
class MethodChannelTimeSlotPlugin extends TimeSlotPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('time_slot_plugin');
}