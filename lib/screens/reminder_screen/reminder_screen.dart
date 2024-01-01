// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
// import 'package:fitness_app/constants/colors.dart';
// import 'package:fitness_app/screens/account_screen/Workout/notification_service.dart';
// import 'package:fitness_app/screens/account_screen/Workout/reminder_list.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class ReminderScreen extends StatefulWidget {
//
//   const ReminderScreen({Key? key,}) : super(key: key);
//
//   @override
//   State<ReminderScreen> createState() => _ReminderScreenState();
// }
//
// class _ReminderScreenState extends State<ReminderScreen>{
//
//   int id = 1;
//   String message = 'It\'s time to shape your body!'; //Just a few minutes a day and you will be in shape in no time. Let\'s get started!
//
//   DateTime? reminderTime;
//   String _valueChanged1 = '';
//   String _valueToValidate1 = '';
//   String _valueSaved1 = '';
//
//   DateTime selectedDate = DateTime.now();
//   DateTime fullDate = DateTime.now();
//
//   Future<DateTime> _selectDate(BuildContext context) async {
//     final date = await showDatePicker(
//         context: context,
//         firstDate: selectedDate,
//         initialDate: selectedDate,
//         lastDate: DateTime(2023, 12, 31)
//     );
//     setState(() {
//       reminderTime = date;
//     });
//     if (date != null) {
//       final time = await showTimePicker(
//         context: context,
//         initialTime: TimeOfDay.fromDateTime(selectedDate),
//       );
//       if (time != null) {
//         setState(() {
//           fullDate = DateTimeField.combine(date, time);
//         });
//         final NotificationService _notificationService = NotificationService();
//         await _notificationService.scheduleNotifications(
//             id: id,
//             title: "Daily Weight Loss Home Workout",
//             body: message,
//             time: fullDate,
//         );
//         //TODO
//         //schedule a notification
//       }
//       return DateTimeField.combine(date, time);
//     } else {
//       return selectedDate;
//     }
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   dateFormate({required String datefrom, }) {
//     final DateTime docDateTime = DateTime.parse(datefrom);
//     return '${DateFormat('dd.MM.yyyy').format(docDateTime)}';
//     // '${DateFormat('dd').format(docDateTime)}-${DateFormat('dd.MM.yyyy').format(docDateTime1)}';
//   }
//
//   @override
//   Widget build(BuildContext context){
//       return Scaffold(
//         backgroundColor: kColorBG,
//         floatingActionButton: FloatingActionButton(
//           backgroundColor: kColorPrimary,
//           onPressed: ()
//           {
//             _selectDate(context);
//             // showDialog(
//             //   context: context,
//             //   builder: (_) =>  Dialog(
//             //     child: DateTimePicker(
//             //       type: DateTimePickerType.dateTimeSeparate,
//             //       //dateMask: 'd MMM, yyyy',
//             //
//             //       // controller: _controller1,
//             //       //initialValue: _initialValue,
//             //       firstDate: DateTime(2000),
//             //       lastDate: DateTime(2100),
//             //
//             //       //icon: Icon(Icons.event),
//             //
//             //       dateLabelText: 'Date',
//             //       timeLabelText: "Hour",
//             //       use24HourFormat: false,
//             //       locale: Locale('pt', 'BR'),
//             //       selectableDayPredicate: (date) {
//             //         if (date.weekday == 6 || date.weekday == 7) {
//             //           return false;
//             //         }
//             //         return true;
//             //       },
//             //       onChanged: (val) {},
//             //       validator: (val) {
//             //         {}
//             //         return null;
//             //       },
//             //       onSaved: (val) {},
//             //     ),
//             //   ),
//             // );
//
//            // _homeBloc.add(RefreshScreenEvent());
//
//           },
//           child: const Icon(Icons.add, color: Colors.white),
//         ),
//         appBar: AppBar(
//           backgroundColor: kColorBG,
//           title: const Text("REMINDER"),
//         ),
//         body: reminderTime == null?
//         Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const [
//             Center(
//               child: Icon(Icons.notifications_none, color: Colors.white, size: 80,),
//             ),
//             SizedBox(height: 10),
//             Text(
//               "Please set your reminder",
//               style: TextStyle(color: Colors.white),
//             ),
//           ],
//         ) :
//         SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               ListView.builder(
//                   shrinkWrap: true,
//                   physics: const BouncingScrollPhysics(),
//                   itemCount:  5,  //reminderTime == null? id : 0
//                   itemBuilder: (ctx, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(top: 5, bottom: 10, left: 10, right: 10),
//                       child: Container(
//                         //height: 300,
//                         decoration: BoxDecoration(
//                           color: kColorFG,
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                                  '${dateFormate(datefrom: fullDate.toString(),)}'
//                                 ),
//                             Text(
//                               reminderTime.toString(),
//                               // "Day Name",
//                               style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               fullDate.toString(),
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             SizedBox(
//                               height: MediaQuery.of(context).size.height*0.05,
//                             ),
//                             // Text(''),
//                             Text(
//                               "Message: $message",
//                             ),
//                             const SizedBox(
//                               height: 15,
//                             ),
//                             // ElevatedButton(
//                             //     onPressed: () => _selectDate(context),
//                             //     child: const Text("Add reminder"))
//                           ],
//                         ),
//                       ),
//                     );
//                   }),
//             ],
//           ),
//         ),
//       );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // class NoteThumbnail extends StatefulWidget {
// //   final int id;
// //   final Color color;
// //   final String title;
// //   final String content;
// //
// //   const NoteThumbnail(
// //       {Key? key,
// //         required this.id,
// //         required this.color,
// //         required this.title,
// //         required this.content})
// //       : super(key: key);
// //
// //   @override
// //   _NoteThumbnailState createState() => _NoteThumbnailState();
// // }
//
// // class _NoteThumbnailState extends State<NoteThumbnail> {
// //   DateTime selectedDate = DateTime.now();
// //   DateTime fullDate = DateTime.now();
// //
// //   Future<DateTime> _selectDate(BuildContext context) async {
// //     final date = await showDatePicker(
// //         context: context,
// //         firstDate: DateTime(1900),
// //         initialDate: selectedDate,
// //         lastDate: DateTime(2100));
// //     if (date != null) {
// //       final time = await showTimePicker(
// //         context: context,
// //         initialTime: TimeOfDay.fromDateTime(selectedDate),
// //       );
// //       if (time != null) {
// //         setState(() {
// //           fullDate = DateTimeField.combine(date, time);
// //         });
// //         final NotificationService _notificationService = NotificationService();
// //         await _notificationService.scheduleNotifications(
// //             id: widget.id,
// //             title: widget.title,
// //             body: widget.content,
// //             time: fullDate);
// //         //TODO
// //         //schedule a notification
// //       }
// //       return DateTimeField.combine(date, time);
// //     } else {
// //       return selectedDate;
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // TODO: implement build
// //     throw UnimplementedError();
// //   }
// // }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Container(
//   //     height: 300,
//   //     decoration: BoxDecoration(
//   //       color: widget.color,
//   //       borderRadius: BorderRadius.circular(10.0),
//   //     ),
//   //     padding: const EdgeInsets.all(10),
//   //     child: Column(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Text(
//   //           widget.title,
//   //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//   //         ),
//   //         const SizedBox(
//   //           height: 5,
//   //         ),
//   //         Text(widget.content),
//   //         const SizedBox(
//   //           height: 80,
//   //         ),
//   //         Text(fullDate.toString()),
//   //         const SizedBox(
//   //           height: 15,
//   //         ),
//   //         // ElevatedButton(
//   //         //     onPressed: () => _selectDate(context),
//   //         //     child: const Text("Add reminder"))
//   //       ],
//   //     ),
//   //   );
//   // }
// // }
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:reminders/reminders.dart';
// //
// // class ReminderScreen extends StatefulWidget {
// //
// //   @override
// //   State<ReminderScreen> createState() => _ReminderScreenState();
// // }
// //
// // class _ReminderScreenState extends State<ReminderScreen> {
// //   final reminders = Reminders();
// //   RemList? currentList;
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //         appBar: AppBar(
// //           actions: [
// //             FutureBuilder(
// //                 future: reminders.hasAccess(),
// //                 builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
// //                   final access = snapshot.data ?? false;
// //                   return access
// //                       ? TextButton(
// //                     onPressed: () => setState(() {
// //                       currentList = null;
// //                     }),
// //                     child: const Text(
// //                       'Get All',
// //                       style: TextStyle(
// //                           color: Colors.white, letterSpacing: 1.0),
// //                     ),
// //                   )
// //                       : const Icon(Icons.cancel_rounded, color: Colors.red);
// //                 }),
// //           ],
// //           title: Text(currentList?.title ?? ''),
// //         ),
// //         drawer: Drawer(
// //           child: FutureBuilder(
// //               future: reminders.getAllLists(),
// //               builder: (BuildContext context,
// //                   AsyncSnapshot<List<RemList>> snapshot) {
// //                 final lists = snapshot.data ?? [];
// //                 return ListView.builder(
// //                     itemBuilder: (context, index) {
// //                       return ListTile(
// //                         title: Text(lists[index].title),
// //                         onTap: () => setState(() {
// //                           currentList = lists[index];
// //                           Navigator.of(context).pop();
// //                         }),
// //                       );
// //                     },
// //                     itemCount: lists.length);
// //               }),
// //         ),
// //         floatingActionButton: FloatingActionButton(
// //           onPressed: () async {
// //             final RemList list = currentList ??
// //                 await reminders.getDefaultList() ??
// //                 RemList('New List');
// //             final reminder =
// //             Reminder(list: list, title: 'Here is a new reminder');
// //             await reminders.saveReminder(reminder);
// //             setState(() {});
// //           },
// //           child: const Icon(Icons.add),
// //         ),
// //         body: buildReminders(currentList?.id),
// //       );
// //   }
// //
// //   Center buildReminders(String? list) {
// //     return Center(
// //       child: FutureBuilder(
// //           future: reminders.getReminders(currentList?.id),
// //           builder:
// //               (BuildContext context, AsyncSnapshot<List<Reminder>?> snapshot) {
// //             if (snapshot.hasData) {
// //               final List<Reminder> rems = snapshot.data ?? [];
// //               return ListView.builder(
// //                   itemCount: rems.length,
// //                   itemBuilder: (context, index) {
// //                     final reminder = rems[index];
// //                     return ListTile(
// //                       leading: Text('${reminder.priority}'),
// //                       title: Row(
// //                         children: [
// //                           Expanded(child: Text(reminder.title)),
// //                           GestureDetector(
// //                             child: Text(
// //                                 reminder.dueDate?.toString() ?? 'No date set'),
// //                             onTap: () async {
// //                               final now = DateTime.now();
// //                               reminder.dueDate =
// //                                   DateTime(now.year, now.month, now.day);
// //                               await reminders.saveReminder(reminder);
// //                               setState(() {});
// //                             },
// //                             onDoubleTap: () async {
// //                               reminder.dueDate = null;
// //                               await reminders.saveReminder(reminder);
// //                               setState(() {});
// //                             },
// //                           )
// //                         ],
// //                       ),
// //                       subtitle:
// //                       reminder.notes != null ? Text(reminder.notes!) : null,
// //                       trailing: GestureDetector(
// //                         child: reminder.isCompleted
// //                             ? const Icon(Icons.check_box)
// //                             : const Icon(Icons.check_box_outline_blank),
// //                         onTap: () async {
// //                           reminder.isCompleted = !reminder.isCompleted;
// //                           await reminders.saveReminder(reminder);
// //                           setState(() {});
// //                         },
// //                       ),
// //                       onLongPress: () async {
// //                         await reminders.deleteReminder(reminder.id!);
// //                         setState(() {});
// //                       },
// //                     );
// //                   });
// //             }
// //
// //             if (snapshot.hasError) {
// //               return Center(child: Text(snapshot.error.toString()));
// //             }
// //
// //             return const Center(child: CircularProgressIndicator());
// //           }),
// //     );
// //   }
// // }