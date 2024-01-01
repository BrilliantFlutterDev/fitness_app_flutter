// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationServices{
//   final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//   final AndroidInitializationSettings _androidInitializationSettings = AndroidInitializationSettings('splash');
//
//   void initialiseNotifications() async {
//     InitializationSettings initializationSettings = InitializationSettings(
//       android: _androidInitializationSettings,
//     );
//     await _flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }
//   void sendNotification(String title, String body) async {
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//       'channelId',
//       'channelName',
//       importance: Importance.max,
//       priority: Priority.high,
//       styleInformation: BigTextStyleInformation(''),
//     );
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );
//     await _flutterLocalNotificationsPlugin.show(
//         0,
//         title,
//         body,
//         notificationDetails
//     );
//   }
//
//   void sheduleNotification(String title, String body) async {
//     AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails(
//         'channelId',
//         'channelName',
//         importance: Importance.max,
//         priority: Priority.high,
//         fullScreenIntent: true,
//         styleInformation: BigTextStyleInformation(''),
//     );
//     NotificationDetails notificationDetails = NotificationDetails(
//       android: androidNotificationDetails,
//     );
//     await _flutterLocalNotificationsPlugin.periodicallyShow(
//         0,
//         title,
//         body,
//         RepeatInterval.hourly,
//         notificationDetails
//     );
//   }
//
//   void stopNotification() async{
//     _flutterLocalNotificationsPlugin.cancelAll();
//   }
// }