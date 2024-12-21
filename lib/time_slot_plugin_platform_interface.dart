import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'time_slot_plugin_method_channel.dart';

abstract class TimeSlotPluginPlatform extends PlatformInterface {
  /// Constructs a TimeSlotPluginPlatform.
  TimeSlotPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TimeSlotPluginPlatform _instance = MethodChannelTimeSlotPlugin();

  /// The default instance of [TimeSlotPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTimeSlotPlugin].
  static TimeSlotPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TimeSlotPluginPlatform] when
  /// they register themselves.
  static set instance(TimeSlotPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
