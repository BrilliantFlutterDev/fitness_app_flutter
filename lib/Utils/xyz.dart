// import 'package:flutter/material.dart';
// import 'package:simple_progress_indicators/simple_progress_indicators.dart';
//
// class SimpleProgressIndicatorsApp extends StatefulWidget {
//   const SimpleProgressIndicatorsApp({Key? key}) : super(key: key);
//
//   @override
//   State<SimpleProgressIndicatorsApp> createState() => _SimpleProgressIndicatorsAppState();
// }
//
// class _SimpleProgressIndicatorsAppState extends State<SimpleProgressIndicatorsApp> {
//   bool full = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: const Text('Simple Progress Indicator Demo'),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Column(
//                 children: [
//                   const Text('ProgressBar'),
//                   ProgressBar(
//                     value: 0.5,
//                     gradient: const LinearGradient(
//                       colors: [
//                         Colors.yellow,
//                         Colors.red,
//                       ],
//                     ),
//                     backgroundColor: Colors.grey.withOpacity(0.4),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   const Text('ProgressBarAnimation'),
//                   ProgressBarAnimation(
//                     duration: const Duration(seconds: 2),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Colors.blue,
//                         Colors.purple,
//                       ],
//                     ),
//                     backgroundColor: Colors.grey.withOpacity(0.4),
//                   ),
//                 ],
//               ),
//               Column(
//                 children: [
//                   const Text('AnimatedProgressBar'),
//                   AnimatedProgressBar(
//                     value: full ? 1.0 : 0.0,
//                     duration: const Duration(seconds: 2),
//                     gradient: const LinearGradient(
//                       colors: [
//                         Colors.amber,
//                         Colors.red,
//                       ],
//                     ),
//                     backgroundColor: Colors.grey.withOpacity(0.4),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       full = !full;
//                       setState(() {});
//                     },
//                     child: Text(full ? 'To 0%' : 'To 100%'),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//       );
//   }
// }

import 'package:date_time_picker/date_time_picker.dart';

import 'package:flutter/material.dart';

class LogoutOverlay extends StatefulWidget {
  const LogoutOverlay({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LogoutOverlayState();
}

class LogoutOverlayState extends State<LogoutOverlay>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: Container(
                margin: EdgeInsets.all(20.0),
                padding: EdgeInsets.all(15.0),
                height: 180.0,

                decoration: ShapeDecoration(
                    color: Color.fromRGBO(41, 167, 77, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0))),
                child:
      DateTimePicker(
        type: DateTimePickerType.dateTimeSeparate,
        dateMask: 'd MMM, yyyy',
        // controller: _controller1,
        //initialValue: _initialValue,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        icon: Icon(Icons.event),
        dateLabelText: 'Date',
        timeLabelText: "Hour",
        use24HourFormat: false,
        locale: Locale('pt', 'BR'),
        selectableDayPredicate: (date) {
          if (date.weekday == 6 || date.weekday == 7) {
            return false;
          }
          return true;
        },
        onChanged: (val) {},
        validator: (val) {
          {}
          return null;
        },
        onSaved: (val) {},
      )),
          ),
        ),
      ),
    );
  }
}