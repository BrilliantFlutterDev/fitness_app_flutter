import 'package:fitness_app/Helper/alarm_helper.dart';
import 'package:fitness_app/alarm_models/models/alarm_info.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:fitness_app/alarm_models/theme_data.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:intl/intl.dart';
import 'package:timezone/timezone.dart' as tz;

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  _AlarmScreenState createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  DateTime? _alarmTime;
  late String _alarmTimeString;
  bool _isRepeatSelected = false;
  final AlarmHelper _alarmHelper = AlarmHelper();
  Future<List<AlarmInfo>>? _alarms;
  List<AlarmInfo>? _currentAlarms;

  @override
  void initState() {
    _alarmTime = DateTime.now();
    _alarmHelper.initializeDatabase().then((value) {
      print('------database intialized');
      loadAlarms();
    });
    super.initState();
  }

  void loadAlarms() {
    _alarms = _alarmHelper.getAlarms();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBG,
      floatingActionButton:
      // _currentAlarms.length < 5 || _currentAlarms.length == 0?
        FloatingActionButton(
        backgroundColor: kColorPrimary,
        onPressed: ()
        {
          _alarmTimeString = DateFormat('hh:mm aa').format(DateTime.now());   //HH:mm
          showModalBottomSheet(
            useRootNavigator: true,
            context: context,
            clipBehavior: Clip.antiAlias,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            builder: (context) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    height: MediaQuery.of(context).size.height*0.3,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () async {
                            var selectedTime = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            );
                            if (selectedTime != null) {
                              final now = DateTime.now();
                              var selectedDateTime = DateTime(
                                  now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
                              _alarmTime = selectedDateTime;
                              setModalState(() {
                                _alarmTimeString = DateFormat('hh:mm aa').format(selectedDateTime);
                              });
                            }
                          },
                          child: Text(
                            _alarmTimeString,
                            style: const TextStyle(fontSize: 32),
                          ),
                        ),
                        ListTile(
                          title: const Text('Repeat'),
                          trailing: Switch(
                            activeColor: kColorPrimary,
                            onChanged: (value) {
                              setModalState(() {
                                _isRepeatSelected = value;
                              });
                            },
                            value: _isRepeatSelected,
                          ),
                        ),
                        // const ListTile(
                        //   title: Text('Sound'),
                        //   trailing: Icon(Icons.arrow_forward_ios),
                        // ),
                        // const ListTile(
                        //   title: Text('Title'),
                        //   trailing: Icon(Icons.arrow_forward_ios),
                        // ),
                        FloatingActionButton.extended(
                          onPressed: () {
                            onSaveAlarm(_isRepeatSelected);
                          },
                          // icon: const Icon(Icons.alarm),
                          label: const Text('Save'),
                          backgroundColor: kColorPrimary,
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
          // scheduleAlarm();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
        //     :
        // FloatingActionButton(
        //   onPressed: (){},
        //   backgroundColor: Colors.grey,
        // ),
      appBar: AppBar(
        backgroundColor: kColorBG,
        title: const Text("REMINDER"),
      ),
      body: _alarms == null?
      Column(
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
      ) :
      Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // const Text(
            //   'Alarm',
            //   style:
            //   TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w700, color: Colors.white, fontSize: 24),
            // ),
            Expanded(
              child: FutureBuilder<List<AlarmInfo>>(
                future: _alarms,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _currentAlarms = snapshot.data;
                    return ListView(
                      children: snapshot.data!.map<Widget>((alarm) {
                        var alarmTime = DateFormat('hh:mm aa').format(alarm.alarmDateTime!);
                        var gradientColor = GradientTemplate.gradientTemplate[alarm.gradientColorIndex!].colors;
                        return Container(
                          margin: const EdgeInsets.only(bottom: 32),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: gradientColor,
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: gradientColor.last.withOpacity(0.4),
                                blurRadius: 8,
                                spreadRadius: 2,
                                offset: const Offset(4, 4),
                              ),
                            ],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(24)
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      children: <Widget>[
                                        const Icon(
                                          Icons.label,
                                          color: Colors.white,
                                          size: 24,
                                        ),
                                        const SizedBox(width: 8),
                                        Text(
                                          alarm.title!,
                                          style: const TextStyle(color: Colors.white, fontFamily: 'avenir'),
                                        ),
                                      ],
                                    ),
                                  ),
                                  // Switch(
                                  //   value: true,
                                  //   onChanged: (bool value) {
                                  //     if(value == true){
                                  //       value = false;
                                  //     } else{
                                  //       value = true;
                                  //     }
                                  //   },
                                  //   activeColor: kColorPrimary,
                                  // ),
                                ],
                              ),
                              const Text(
                                'EveryDay',
                                style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    alarmTime,
                                    style: const TextStyle(
                                        color: Colors.white, fontFamily: 'avenir', fontSize: 24, fontWeight: FontWeight.w700),
                                  ),
                                  IconButton(
                                      icon: const Icon(Icons.delete),
                                      color: Colors.white,
                                      onPressed: () {
                                        deleteAlarm(alarm.id);
                                      }),
                                ],
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                        // .followedBy([
                      //   if (_currentAlarms!.length < 5)
                      //     DottedBorder(
                      //       strokeWidth: 2,
                      //       color: const Color(0xFFEAECFF),
                      //       borderType: BorderType.RRect,
                      //       radius: const Radius.circular(24),
                      //       dashPattern: const [5, 4],
                      //       child: Container(
                      //         width: double.infinity,
                      //         decoration: const BoxDecoration(
                      //           color: Color(0xFF444974),
                      //           borderRadius: BorderRadius.all(Radius.circular(24)),
                      //         ),
                      //         child: MaterialButton(
                      //           padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      //           onPressed: () {
                      //             _alarmTimeString = DateFormat('HH:mm').format(DateTime.now());
                      //             showModalBottomSheet(
                      //               useRootNavigator: true,
                      //               context: context,
                      //               clipBehavior: Clip.antiAlias,
                      //               shape: const RoundedRectangleBorder(
                      //                 borderRadius: BorderRadius.vertical(
                      //                   top: Radius.circular(24),
                      //                 ),
                      //               ),
                      //               builder: (context) {
                      //                 return StatefulBuilder(
                      //                   builder: (context, setModalState) {
                      //                     return Container(
                      //                       padding: const EdgeInsets.all(20),
                      //                       child: Column(
                      //                         children: [
                      //                           TextButton(
                      //                             onPressed: () async {
                      //                               var selectedTime = await showTimePicker(
                      //                                 context: context,
                      //                                 initialTime: TimeOfDay.now(),
                      //                               );
                      //                               if (selectedTime != null) {
                      //                                 final now = DateTime.now();
                      //                                 var selectedDateTime = DateTime(
                      //                                     now.year, now.month, now.day, selectedTime.hour, selectedTime.minute);
                      //                                 _alarmTime = selectedDateTime;
                      //                                 setModalState(() {
                      //                                   _alarmTimeString = DateFormat('HH:mm').format(selectedDateTime);
                      //                                 });
                      //                               }
                      //                             },
                      //                             child: Text(
                      //                               _alarmTimeString,
                      //                               style: const TextStyle(fontSize: 32),
                      //                             ),
                      //                           ),
                      //                           ListTile(
                      //                             title: const Text('Repeat'),
                      //                             trailing: Switch(
                      //                               onChanged: (value) {
                      //                                 setModalState(() {
                      //                                   _isRepeatSelected = value;
                      //                                 });
                      //                               },
                      //                               value: _isRepeatSelected,
                      //                             ),
                      //                           ),
                      //                           // const ListTile(
                      //                           //   title: Text('Sound'),
                      //                           //   trailing: Icon(Icons.arrow_forward_ios),
                      //                           // ),
                      //                           const ListTile(
                      //                             title: Text('Title'),
                      //                             trailing: Icon(Icons.arrow_forward_ios),
                      //                           ),
                      //                           FloatingActionButton.extended(
                      //                             onPressed: () {
                      //                               onSaveAlarm(_isRepeatSelected);
                      //                             },
                      //                             icon: const Icon(Icons.alarm),
                      //                             label: const Text('Save'),
                      //                             backgroundColor: kColorPrimary,
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     );
                      //                   },
                      //                 );
                      //               },
                      //             );
                      //             // scheduleAlarm();
                      //           },
                      //           child: Column(
                      //             children: <Widget>[
                      //               Image.asset(
                      //                 'assets/add_alarm.png',
                      //                 scale: 1.5,
                      //               ),
                      //               const SizedBox(height: 8),
                      //               const Text(
                      //                 'Add Alarm',
                      //                 style: TextStyle(color: Colors.white, fontFamily: 'avenir'),
                      //               ),
                      //             ],
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   else
                      //     const Center(
                      //         child: Text(
                      //           'Only 5 alarms allowed!',
                      //           style: TextStyle(color: Colors.white),
                      //         )),
                      // ]).toList(),
                    );
                  }
                  return const Center(
                    child: Text(
                      'Loading..',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void scheduleAlarm(DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo, {required bool isRepeating}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      channelDescription: 'Channel for Alarm notification',
      icon: 'splash',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('splash'),
    );

    var iOSPlatformChannelSpecifics = const DarwinNotificationDetails(
      sound: 'a_long_cold_sting.wav',
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );

    if (isRepeating) {
      await flutterLocalNotificationsPlugin.showDailyAtTime(
        0,
        'Time to shape your body!',
        alarmInfo.title,
        Time(
          scheduledNotificationDateTime.hour,
          scheduledNotificationDateTime.minute,
          scheduledNotificationDateTime.second,
        ),
        platformChannelSpecifics,
      );
    } else
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Time to shape your body!',
        alarmInfo.title,
        tz.TZDateTime.from(scheduledNotificationDateTime, tz.local),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
      );
  }

  void onSaveAlarm(bool _isRepeating) {
    DateTime? scheduleAlarmDateTime;
    if (_alarmTime!.isAfter(DateTime.now()))
      scheduleAlarmDateTime = _alarmTime;
    else
      scheduleAlarmDateTime = _alarmTime!.add(Duration(days: 1));

    var alarmInfo = AlarmInfo(
      alarmDateTime: scheduleAlarmDateTime,
      gradientColorIndex: _currentAlarms!.length,
      title: 'alarm',
    );
    _alarmHelper.insertAlarm(alarmInfo);
    if (scheduleAlarmDateTime != null) {
      scheduleAlarm(scheduleAlarmDateTime, alarmInfo, isRepeating: _isRepeating);
    }
    Navigator.pop(context);
    loadAlarms();
  }

  void deleteAlarm(int? id) {
    _alarmHelper.delete(id);
    //unsubscribe for notification
    loadAlarms();
  }
}
