import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:time_slot_plugin/time_slot_plugin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  List<TimeOfDay> list = [];
  List<TimeSlot> timeSlotList = [];

  @override
  void initState() {
    super.initState();
    getTimeSlotList();
    getTimeSlotObjectList();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text('List with (time of day)'),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        TimeOfDay timeOfDay = list[index];
                        return Chip(label: Text(timeOfDay.format(context)));
                      },
                      itemCount: list.length,
                    ),
                  ),
                ],
              ),
            ),
            VerticalDivider(),
            Expanded(
              child: Column(
                children: [
                  Text('List with (time slot object)'),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        TimeSlot timeSlot = timeSlotList[index];
                        return InkWell(
                          onTap: () {
                            timeSlot.isSelected ??= false;
                            timeSlot.isSelected == false
                                ? timeSlot.isSelected = true
                                : timeSlot.isSelected = false;
                            setState(() {});
                          },
                          child: Chip(
                            label: Text(timeSlot.time!.format(context)),
                            backgroundColor: timeSlot.isSelected == null
                                ? Colors.transparent
                                : timeSlot.isSelected!
                                    ? Colors.green
                                    : Colors.transparent,
                          ),
                        );
                      },
                      itemCount: timeSlotList.length,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getTimeSlotList() {
    TimeOfDay start = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay close = const TimeOfDay(hour: 21, minute: 0);
    int intervalInMins = 30;
    list = TimeSlotPlugin.getTimeSlotList(
        start: start, close: close, intervalTimeInMin: intervalInMins);
    setState(() {});
  }

  void getTimeSlotObjectList() {
    TimeOfDay start = const TimeOfDay(hour: 9, minute: 0);
    TimeOfDay close = const TimeOfDay(hour: 21, minute: 0);
    int intervalInMins = 30;
    timeSlotList = TimeSlotPlugin.getTimeSlotObjectList(
        start: start, close: close, intervalTimeInMin: intervalInMins);
    setState(() {});
  }
}
