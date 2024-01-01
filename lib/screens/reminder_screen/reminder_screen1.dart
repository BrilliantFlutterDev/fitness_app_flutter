import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:fitness_app/screens/reminder_screen/ring.dart';
import 'package:fitness_app/screens/reminder_screen/tile.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'edit_alarm.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  late List<AlarmSettings> alarms;

  static StreamSubscription? subscription;

  @override
  void initState() {
    super.initState();
    loadAlarms();
    subscription ??= Alarm.ringStream.stream.listen(
          (alarmSettings) => navigateToRingScreen(alarmSettings),
    );
  }

  void loadAlarms() {
    setState(() {
      alarms = Alarm.getAlarms();
      alarms.sort((a, b) => a.dateTime.isBefore(b.dateTime) ? 0 : 1);
    });
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              AlarmRingScreen(alarmSettings: alarmSettings),
        ));
    loadAlarms();
  }

  Future<void> navigateToAlarmScreen(AlarmSettings? settings) async {
    final res = await showModalBottomSheet<bool?>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) {
          return FractionallySizedBox(
            heightFactor: 0.6,
            child: AlarmEditScreen(alarmSettings: settings),
          );
        });

    if (res != null && res == true) loadAlarms();
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBG,
      appBar: AppBar(
        backgroundColor: kColorBG,
        title: const Text("REMINDER"),
      ),
      body: SafeArea(
        child: alarms.isNotEmpty?
          ListView.separated(
            itemCount: alarms.length,
            separatorBuilder: (context, index) => const Divider(color: kColorFG),
            itemBuilder: (context, index) {
              return AlarmTile(
              key: Key(alarms[index].id.toString()),
              title: TimeOfDay(
                hour: alarms[index].dateTime.hour,
                minute: alarms[index].dateTime.minute,
              ).format(context),
              onPressed: () => navigateToAlarmScreen(alarms[index]),
              onDismissed: () {
                Alarm.stop(alarms[index].id).then((_) => loadAlarms());
              },
            );
          },
        )
        : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Center(
              child: Icon(Icons.notifications_none, color: Colors.white, size: 80,),
            ),
            SizedBox(height: 10),
            Text(
              "Please set your reminder",
              style: TextStyle(color: Colors.white),
            ),
          ],
        )
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 15, bottom: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // FloatingActionButton(
            //   onPressed: () {
            //     final alarmSettings = AlarmSettings(
            //       id: 42,
            //       dateTime: DateTime.now(),
            //       assetAudioPath: 'assets/mozart.mp3',
            //     );
            //     Alarm.set(alarmSettings: alarmSettings);
            //   },
            //   backgroundColor: Colors.red,
            //   heroTag: null,
            //   child: const Text("RING NOW", textAlign: TextAlign.center),
            // ),
            FloatingActionButton(
              backgroundColor: kColorPrimary,
              onPressed: () => navigateToAlarmScreen(null),
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}