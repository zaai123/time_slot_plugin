import 'dart:developer';

import 'package:flutter/material.dart';

import 'time_slot_plugin_platform_interface.dart';

class TimeSlotPlugin {
  Future<String?> getPlatformVersion() {
    return TimeSlotPluginPlatform.instance.getPlatformVersion();
  }

  static List<TimeOfDay> getTimeSlotList(
      {required TimeOfDay start,
      required TimeOfDay close,
      required int intervalTimeInMin}) {
    List<TimeOfDay> timeSlots = [];
    Duration duration = Duration(minutes: intervalTimeInMin);
    DateTime startTime = DateTime(0, 0, 0, start.hour, start.minute);
    DateTime closeTime = DateTime(0, 0, 0, close.hour, close.minute);
    if (startTime.isAfter(closeTime)) {
      log('Start time is > than close time');
      return timeSlots;
    }
    while (startTime.isBefore(closeTime)) {
      if (timeSlots.isEmpty) {
        TimeOfDay addAbleTime =
            TimeOfDay(hour: startTime.hour, minute: startTime.minute);
        timeSlots.add(addAbleTime);
      }

      startTime =
          DateTime(0, 0, 0, startTime.hour, startTime.minute).add(duration);
      TimeOfDay addAbleTime =
          TimeOfDay(hour: startTime.hour, minute: startTime.minute);
      if (startTime.isBefore(closeTime) ||
          startTime.isAtSameMomentAs(closeTime)) timeSlots.add(addAbleTime);
    }
    return timeSlots;
  }

  static List<TimeSlot> getTimeSlotObjectList(
      {required TimeOfDay start,
      required TimeOfDay close,
      required int intervalTimeInMin}) {
    List<TimeSlot> timeSlots = [];
    Duration duration = Duration(minutes: intervalTimeInMin);
    DateTime startTime = DateTime(0, 0, 0, start.hour, start.minute);
    DateTime closeTime = DateTime(0, 0, 0, close.hour, close.minute);
    if (startTime.isAfter(closeTime)) {
      return timeSlots;
    }
    while (startTime.isBefore(closeTime)) {
      if (timeSlots.isEmpty) {
        TimeOfDay addAbleTime =
            TimeOfDay(hour: startTime.hour, minute: startTime.minute);
        timeSlots.add(
            TimeSlot(isSelected: false, isBreakTime: false, time: addAbleTime));
      }

      startTime =
          DateTime(0, 0, 0, startTime.hour, startTime.minute).add(duration);
      TimeOfDay addAbleTime =
          TimeOfDay(hour: startTime.hour, minute: startTime.minute);
      if (startTime.isBefore(closeTime) ||
          startTime.isAtSameMomentAs(closeTime)) {
        timeSlots.add(
            TimeSlot(isSelected: false, isBreakTime: false, time: addAbleTime));
      }
    }
    return timeSlots;
  }
}

class TimeSlot {
  TimeOfDay? time;
  bool? isSelected = false;
  bool? isBreakTime = false;
  bool? isAvailable = true;

  TimeSlot({this.time, this.isSelected, this.isBreakTime, this.isAvailable});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TimeSlot &&
          runtimeType == other.runtimeType &&
          time == other.time &&
          isSelected == other.isSelected &&
          isBreakTime == other.isBreakTime;

  @override
  int get hashCode =>
      time.hashCode ^ isSelected.hashCode ^ isBreakTime.hashCode;
}
