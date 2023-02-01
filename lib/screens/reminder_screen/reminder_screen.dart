import 'package:date_time_picker/date_time_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/account_screen/Workout/notification_service.dart';
import 'package:fitness_app/screens/account_screen/Workout/reminder_list.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ReminderScreen extends StatefulWidget {

  final int id;
  final String title;
  final String content;

  const ReminderScreen({Key? key, required this.id, required this.title, required this.content}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>{

  ExerciseConstants constants = ExerciseConstants();

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';
  late HomeBloc _homeBloc;

  DateTime selectedDate = DateTime.now();
  DateTime fullDate = DateTime.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        firstDate: selectedDate,
        initialDate: selectedDate,
        lastDate: DateTime(2023, 12, 31)
    );
    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(selectedDate),
      );
      if (time != null) {
        setState(() {
          fullDate = DateTimeField.combine(date, time);
        });
        final NotificationService _notificationService = NotificationService();
        await _notificationService.scheduleNotifications(
            id: widget.id,
            title: widget.title,
            body: widget.content,
            time: fullDate
        );
        //TODO
        //schedule a notification
      }
      return DateTimeField.combine(date, time);
    } else {
      return selectedDate;
    }
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context){
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is LoadingState) {
      } else if (state is ErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white,
            fontSize: 12.0);
      } else if (state is RefreshScreenState) {
        print("Refresh State>>>>>>>>>>>>");

      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: kColorBG,
        floatingActionButton: FloatingActionButton(
          backgroundColor: kColorPrimary,
          onPressed: ()
          {
            print(">>>>>>>>>>>>>Pressed");
            _selectDate(context);
            // showDialog(
            //   context: context,
            //   builder: (_) =>  Dialog(
            //     child: DateTimePicker(
            //       type: DateTimePickerType.dateTimeSeparate,
            //       //dateMask: 'd MMM, yyyy',
            //
            //       // controller: _controller1,
            //       //initialValue: _initialValue,
            //       firstDate: DateTime(2000),
            //       lastDate: DateTime(2100),
            //
            //       //icon: Icon(Icons.event),
            //
            //       dateLabelText: 'Date',
            //       timeLabelText: "Hour",
            //       use24HourFormat: false,
            //       locale: Locale('pt', 'BR'),
            //       selectableDayPredicate: (date) {
            //         if (date.weekday == 6 || date.weekday == 7) {
            //           return false;
            //         }
            //         return true;
            //       },
            //       onChanged: (val) {},
            //       validator: (val) {
            //         {}
            //         return null;
            //       },
            //       onSaved: (val) {},
            //     ),
            //   ),
            // );

           // _homeBloc.add(RefreshScreenEvent());

          },
          child: Icon(Icons.add, color: Colors.white),
        ),
        appBar: AppBar(
          backgroundColor: kColorBG,
          title: const Text("REMINDER"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Center(
            //   child: Icon(Icons.notifications_none, color: Colors.white, size: 80,),
            // ),
            // SizedBox(height: 10),
            // Text("Please set your reminder",
            //   style: TextStyle(color: Colors.white),
            // ),
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: 1,
                itemBuilder: (ctx, index) {
                  return Container(
                    //height: 300,
                    decoration: BoxDecoration(
                      color: kColorFG,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   widget.title,
                        //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        // ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          fullDate.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.05,
                        ),
                        // Text(''),
                        Text(
                          "Message: ${widget.content}",
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        // ElevatedButton(
                        //     onPressed: () => _selectDate(context),
                        //     child: const Text("Add reminder"))
                      ],
                    ),
                  );
                }),
          ],
        ),
      );});
  }
}


// class NoteThumbnail extends StatefulWidget {
//   final int id;
//   final Color color;
//   final String title;
//   final String content;
//
//   const NoteThumbnail(
//       {Key? key,
//         required this.id,
//         required this.color,
//         required this.title,
//         required this.content})
//       : super(key: key);
//
//   @override
//   _NoteThumbnailState createState() => _NoteThumbnailState();
// }

// class _NoteThumbnailState extends State<NoteThumbnail> {
//   DateTime selectedDate = DateTime.now();
//   DateTime fullDate = DateTime.now();
//
//   Future<DateTime> _selectDate(BuildContext context) async {
//     final date = await showDatePicker(
//         context: context,
//         firstDate: DateTime(1900),
//         initialDate: selectedDate,
//         lastDate: DateTime(2100));
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
//             id: widget.id,
//             title: widget.title,
//             body: widget.content,
//             time: fullDate);
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
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //     height: 300,
  //     decoration: BoxDecoration(
  //       color: widget.color,
  //       borderRadius: BorderRadius.circular(10.0),
  //     ),
  //     padding: const EdgeInsets.all(10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Text(
  //           widget.title,
  //           style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //         ),
  //         const SizedBox(
  //           height: 5,
  //         ),
  //         Text(widget.content),
  //         const SizedBox(
  //           height: 80,
  //         ),
  //         Text(fullDate.toString()),
  //         const SizedBox(
  //           height: 15,
  //         ),
  //         // ElevatedButton(
  //         //     onPressed: () => _selectDate(context),
  //         //     child: const Text("Add reminder"))
  //       ],
  //     ),
  //   );
  // }
// }