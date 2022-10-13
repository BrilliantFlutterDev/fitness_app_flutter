// import 'package:fitness_app/constants.dart';
// import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
// import 'package:fitness_app/widgets/color_remover.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:table_calendar/table_calendar.dart';
//
// import '../../constants/colors.dart';
//
// class HistoryScreen extends StatefulWidget {
//   @override
//   State<HistoryScreen> createState() => _HistoryScreenState();
// }
//
// class _HistoryScreenState extends State<HistoryScreen> {
//   // DateTime dateTime = DateTime.now();
//   // int days = 30;
//
//   CalendarController _controller = CalendarController();
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = CalendarController();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var screenSize = MediaQuery.of(context).size;
//     return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
//       if (state is LoadingState) {
//       } else if (state is ErrorState) {
//         Fluttertoast.showToast(
//             msg: state.error,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.grey.shade400,
//             textColor: Colors.white,
//             fontSize: 12.0);
//       } else if (state is RefreshScreenState) {}
//     }, builder: (context, state) {
//       return Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xff1c1b20),
//           title: const Text("HISTORY"),
//         ),
//         body: SingleChildScrollView(
//           child: ColorRemover(
//             child: Column(
//               children: [
//                 TableCalendar(
//                   initialCalendarFormat: CalendarFormat.month,
//                   calendarStyle: CalendarStyle(
//                       todayColor: kFirstColor,
//                       selectedColor: Theme.of(context).primaryColor,
//                       todayStyle: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 22.0,
//                           color: Colors.white)),
//                   headerStyle: HeaderStyle(
//                     centerHeaderTitle: true,
//                     formatButtonDecoration: BoxDecoration(
//                       color: Colors.brown,
//                       borderRadius: BorderRadius.circular(22.0),
//                     ),
//                     formatButtonTextStyle: TextStyle(color: Colors.white),
//                     formatButtonShowsNext: false,
//                   ),
//                   startingDayOfWeek: StartingDayOfWeek.monday,
//                   // onDaySelected: (date, events) {
//                   //   print(date.toUtc());
//                   // },
//                   builders: CalendarBuilders(
//                     selectedDayBuilder: (context, date, events) => Container(
//                         margin: const EdgeInsets.all(5.0),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Theme.of(context).primaryColor,
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Text(
//                           date.day.toString(),
//                           style: TextStyle(color: Colors.white),
//                         )),
//                     todayDayBuilder: (context, date, events) => Container(
//                         margin: const EdgeInsets.all(5.0),
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Color(0xff1ce5c1),
//                             borderRadius: BorderRadius.circular(8.0)),
//                         child: Text(
//                           date.day.toString(),
//                           style: TextStyle(color: Colors.white),
//                         )),
//                   ),
//                   calendarController: _controller,
//                 ),
//                 // CalenderPicker(
//                 //   dateTime,
//                 //   daysCount: days,
//                 //   // ignore: avoid_print
//                 //   enableMultiSelection: true,
//                 //   // ignore: avoid_print
//                 //   multiSelectionListener: (value) => print(value),
//                 //   selectionColor: kColorPrimary,
//                 //   selectedTextColor: Colors.white,
//                 // ),
//                 Padding(
//                   padding: EdgeInsets.only(top: 8, bottom: 8, left: 15),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       "October 2022",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(left: 10, right: 10),
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.all(Radius.circular(10))),
//                   child: Padding(
//                     padding:
//                         EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 5),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Oct 2 - Oct 8",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 18,
//                                   color: Colors.white),
//                             ),
//                             SizedBox(height: 5),
//                             Text(
//                               "1 Workout",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                           ],
//                         ),
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               children: [
//                                 Icon(Icons.timer, size: 18),
//                                 Text(
//                                   "00:00",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 5),
//                             Row(
//                               children: [
//                                 Icon(Icons.timer, size: 18),
//                                 Text(
//                                   "0.0Kcal",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
