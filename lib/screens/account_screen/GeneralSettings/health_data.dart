import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

enum Gender {Male, Female}

class HealthData extends StatefulWidget {
  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {

  //ValueNotifier<Gender> _selectedItem = new ValueNotifier<Gender>(Gender.Male);
  Gender? _selectedItem = Gender.Male;

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

      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("HEALTH DATA"),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) =>  Dialog(

                        child: Container(
                          height:  MediaQuery.of(context).size.height*0.17,
                          child: Column(
                            children: [
                              RadioListTile(
                                title: const Text("Male"),
                                value: Gender.Male,
                                groupValue: _selectedItem,
                                onChanged: (Gender? value) {
                                setState(() {
                                  _selectedItem = value;
                                  });
                                },
                              ),
                              RadioListTile(
                                title: const Text("Female"),
                                value: Gender.Female,
                                groupValue: _selectedItem,
                                onChanged: (Gender? value) {
                                setState(() {
                                  _selectedItem = value;
                                  });
                                },
                              ),
                            ],
                          )
                          // PopupMenuButton<Gender>(
                          //   itemBuilder: (BuildContext context) {
                          //     return List<PopupMenuEntry<Gender>>.generate(
                          //       Gender.values.length,
                          //           (int index) {
                          //         return PopupMenuItem(
                          //           value: Gender.values[index],
                          //           child: AnimatedBuilder(
                          //             child: Text(Gender.values[index].toString()),
                          //             animation: _selectedItem,
                          //             builder: (BuildContext context, Widget? child) {
                          //               return RadioListTile<Gender>(
                          //                 value: Gender.values[index],
                          //                 groupValue: _selectedItem.value,
                          //                 title: child,
                          //                 onChanged: (Gender? value) {
                          //                   _selectedItem.value = value!;
                          //                 },
                          //               );
                          //             },
                          //           ),
                          //         );
                          //       },
                          //     );
                          //   },
                          // ),

                        ),
                      )
                    );

                },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gender",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "Male",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      )
                    ),

                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  child: Divider(
                    height: 1,
                    color: Colors.white10,
                  ),
                ),

                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "1990-01-01",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      );});
    }
  }







// class MyHomePage extends StatelessWidget {
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           ElevatedButton(
//             child: Text("open picker dialog"),
//             onPressed: () async {
//               var datePicked = await DatePicker.showSimpleDatePicker(
//                 context,
//                 initialDate: DateTime(1994),
//                 firstDate: DateTime(1960),
//                 lastDate: DateTime(2012),
//                 dateFormat: "dd-MMMM-yyyy",
//                 locale: DateTimePickerLocale.th,
//                 looping: true,
//               );
//
//               final snackBar =
//               SnackBar(content: Text("Date Picked $datePicked"));
//               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             },
//           ),
//           ElevatedButton(
//             child: Text("Show picker widget"),
//             onPressed: () {
//               Navigator.push(
//                   context, MaterialPageRoute(builder: (_) => WidgetPage()));
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class WidgetPage extends StatefulWidget {
//   @override
//   _WidgetPageState createState() => _WidgetPageState();
// }
//
// class _WidgetPageState extends State<WidgetPage> {
//   DateTime? _selectedDate;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                 begin: FractionalOffset.topCenter,
//                 end: FractionalOffset.bottomCenter,
//                 colors: [
//                   Colors.grey[900]!,
//                   Colors.black,
//                 ],
//                 stops: const [0.7, 1.0],
//               )),
//           child: Center(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 25),
//                   child: DatePickerWidget(
//                     looping: false, // default is not looping
//                     firstDate: DateTime.now(), //DateTime(1960),
//                     //  lastDate: DateTime(2002, 1, 1),
// //              initialDate: DateTime.now(),// DateTime(1994),
//                     dateFormat:
//                     // "MM-dd(E)",
//                     "dd/MMMM/yyyy",
//                     // locale: DatePicker.localeFromString('th'),
//                     onChange: (DateTime newDate, _) {
//                       setState(() {
//                         _selectedDate = newDate;
//                       });
//                       print(_selectedDate);
//                     },
//                     pickerTheme: DateTimePickerTheme(
//                       backgroundColor: Colors.transparent,
//                       itemTextStyle:
//                       TextStyle(color: Colors.white, fontSize: 19),
//                       dividerColor: Colors.white,
//                     ),
//                   ),
//                 ),
//                 Text("${_selectedDate ?? ''}"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//     //var locale = "zh";
//     // return SafeArea(
//     //   child: Scaffold(
//     //     body: Center(
//     //       child: DatePickerWidget(
//     //         locale: //locale == 'zh'
//     //             DateTimePickerLocale.zh_cn
//     //             //  DateTimePickerLocale.en_us
//     //         ,
//     //         lastDate: DateTime.now(),
//     //         // dateFormat: "yyyy : MMM : dd",
//     //         // dateFormat: 'yyyy MMMM dd',
//     //         onChange: (DateTime newDate, _) {
//     //           setState(() {
//     //             var dob = newDate.toString();
//     //             print(dob);
//     //           });
//     //         },
//     //         pickerTheme: DateTimePickerTheme(
//     //           backgroundColor: Colors.transparent,
//     //           dividerColor: const Color(0xffe3e3e3),
//     //           itemTextStyle: TextStyle(
//     //             fontFamily: 'NotoSansTC',
//     //             fontSize: 18,
//     //             fontWeight: FontWeight.w500,
//     //             color: Theme.of(context).primaryColor,
//     //           ),
//     //         ),
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }