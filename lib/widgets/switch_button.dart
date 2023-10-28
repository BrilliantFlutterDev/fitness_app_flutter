import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants/colors.dart';

class SwitchButton extends StatefulWidget {

  bool status;
  final Function(bool)? whenpress;
  SwitchButton({Key? key, required this.status, required this.whenpress,}) : super(key: key);

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {

  void saveDrinkNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    widget.status = prefs.getBool("drinknotification")!;
  }

  @override
  void initState() {
    super.initState();
    saveDrinkNotification();
  }

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
      activeColor: kColorPrimary,
      width: 50,
      height: 25,
      toggleSize: 10,
      value: widget.status,
      borderRadius: 30,
      padding: 8.0,
      showOnOff: false,
      onToggle: (val) async {
        setState(() {
          widget.status = val;
        });
        if(widget.status) {
          bool isallowed = await AwesomeNotifications().isNotificationAllowed();
          if (!isallowed) {
            //no permission of local notification
            AwesomeNotifications().requestPermissionToSendNotifications();
          }else{
            //show notification
            AwesomeNotifications().createNotification(
              content: NotificationContent( //simgple notification
                id: 123,
                channelKey: 'basic', //set configuration wuth key "basic"
                title: 'It\'s time to hydrate!',
                body: 'Water helps flush toxins from your kidneys.',
                payload: {"name":"FlutterCampus"},
                notificationLayout: NotificationLayout.BigText,
              ),
              // schedule: NotificationCalendar.fromDate(
              //     date: DateTime.now().add(
              //         const Duration(seconds: 10)
              //     ),
              //     repeats: true,
              //     allowWhileIdle: false,
              //     preciseAlarm: true
              // ),

              schedule: NotificationInterval(
                interval: 3600,
                repeats: false,
              ),
            );
          }
        } else{
          AwesomeNotifications().dismiss(123);
          // AwesomeNotifications().dismissAllNotifications();
        }
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool("drinknotification", widget.status);
      },
    );
  }
}