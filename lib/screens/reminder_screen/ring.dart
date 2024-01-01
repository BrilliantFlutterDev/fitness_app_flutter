import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class AlarmRingScreen extends StatelessWidget {
  final AlarmSettings alarmSettings;

  const AlarmRingScreen({Key? key, required this.alarmSettings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBG,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "It\'s time to shape your body!",
                  // "You alarm (${alarmSettings.id}) is ringing...",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 15,),
                const Text("🔔", style: TextStyle(fontSize: 50)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    final now = DateTime.now();
                    Alarm.set(
                      alarmSettings: alarmSettings.copyWith(
                        dateTime: DateTime(
                          now.year,
                          now.month,
                          now.day,
                          now.hour,
                          now.minute,
                          0,
                          0,
                        ).add(const Duration(minutes: 15)),
                      ),
                    ).then((_) => Navigator.pop(context));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        "Snooze",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                        //Icons.play_arrow,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Alarm.stop(alarmSettings.id)
                        .then((_) => Navigator.pop(context));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: BoxDecoration(
                      borderRadius:
                      BorderRadius.circular(50),
                      color: kColorPrimary,
                    ),
                    child: const Center(
                      child: Text(
                        "Stop",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        //Icons.play_arrow,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // RawMaterialButton(
                //   fillColor: kColorPrimary,
                //   onPressed: () {
                //     Alarm.stop(alarmSettings.id)
                //         .then((_) => Navigator.pop(context));
                //   },
                //   child: Text(
                //     "Stop",
                //     style: Theme.of(context).textTheme.titleLarge,
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}