import 'package:flutter_test/flutter_test.dart';
import 'package:time_slot_plugin/time_slot_plugin.dart';
import 'package:time_slot_plugin/time_slot_plugin_platform_interface.dart';
import 'package:time_slot_plugin/time_slot_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTimeSlotPluginPlatform
    with MockPlatformInterfaceMixin
    implements TimeSlotPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TimeSlotPluginPlatform initialPlatform = TimeSlotPluginPlatform.instance;

  test('$MethodChannelTimeSlotPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTimeSlotPlugin>());
  });

  test('getPlatformVersion', () async {
    TimeSlotPlugin timeSlotPlugin = TimeSlotPlugin();
    MockTimeSlotPluginPlatform fakePlatform = MockTimeSlotPluginPlatform();
    TimeSlotPluginPlatform.instance = fakePlatform;

    expect(await timeSlotPlugin.getPlatformVersion(), '42');
  });
}
