# time_slot_plugin

A new Flutter project.

## Getting Started

Plugin to get time slots as list in from start time to close time

## Get list of TimeOfDay

```
 void getTimeSlotList() {
    TimeOfDay start = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay close = const TimeOfDay(hour: 21, minute: 0);
    int intervalInMins = 30;
    list = TimeSlotPlugin.getTimeSlotList(
        start: start, close: close, intervalTimeInMin: intervalInMins);
    setState(() {});
  }
```

## Get list as an object of TimeSlot
### With this Object you can add your functions like select time, etc...

```
  void getTimeSlotObjectList() {
    TimeOfDay start = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay close = const TimeOfDay(hour: 21, minute: 0);
    int intervalInMins = 30;
    timeSlotList = TimeSlotPlugin.getTimeSlotObjectList(
        start: start, close: close, intervalTimeInMin: intervalInMins);
    setState(() {});
  }

```

| ![Image](https://raw.githubusercontent.com/zaai123/time_slot_plugin/refs/heads/main/assets/screen_shot.png)

This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/to/develop-plugins),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

