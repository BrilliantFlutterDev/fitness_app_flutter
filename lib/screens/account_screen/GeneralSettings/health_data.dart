import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:enum_to_string/enum_to_string.dart';

import '../../../constants/colors.dart';

enum Gender {Male, Female}

class HealthData extends StatefulWidget {

  @override
  State<HealthData> createState() => _HealthDataState();
}

class _HealthDataState extends State<HealthData> {

  Gender selectedGender = Gender.Male;

  DateTime birthdate = DateTime.now();
  DateFormat dateFormat = DateFormat('dd-MMMM-yyyy');
  // DateFormat dateFormat = DateFormat('yyyy/MM/dd');
  late String DOB;

  @override
  void initState() {
    super.initState();
    DOB = dateFormat.format(birthdate);
    saveGender();
    saveDOB();
    // _datebirth(context);
  }

  void saveGender() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedGender = EnumToString.fromString(Gender.values, prefs.getString("gender").toString())!;
    setState(() {
      // selectedGender = EnumToString.fromString(Gender.values, prefs.getString("gender").toString())!;
    });
  }

  void saveDOB() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    DOB = pref.getString('birthdate')!;
  }

  Future<void> _datebirth(BuildContext context) async {
    var _datePicked = await DatePicker.showSimpleDatePicker(
      context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1923),
      lastDate: DateTime.now(),//DateTime(2023, 12, 31),
      dateFormat: "yyyy-MMMM-dd",
      locale: DateTimePickerLocale.en_us,
      backgroundColor: kColorFG,
      looping: false,
      textColor: kColorPrimary,
      confirmText: 'SET',
      cancelText: 'CANCEL',
      itemTextStyle: TextStyle(color: Colors.white),
    );
    setState(() {
      DOB = _datePicked!.toString();
    });
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('birthdate', DOB);
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

      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: kColorBG,
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
          width: AdmobHelper.getBannerAd().size.width.toDouble(),//double.infinity,
          child: AdWidget(
            ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
            key: UniqueKey(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kColorBG,
          // backgroundColor: const Color(0xff1c1b20),
          title: const Text("HEALTH DATA"),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: kColorFG,
                        content: StatefulBuilder(
                            builder: (BuildContext context, StateSetter setState) {
                              return Container(
                                  height: MediaQuery.of(context).size.height * 0.24,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Gender",
                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                      ),
                                      RadioListTile(
                                        activeColor: kColorPrimary,
                                        title: const Text("Male"),
                                        value: Gender.Male,
                                        groupValue: selectedGender,
                                        onChanged: (Gender? value) async {
                                          setState(() {
                                            selectedGender = Gender.Male;
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushNamed(context, '/healthdata');
                                            // Navigator.pop(context, '/healthdata');
                                          });
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString("gender", EnumToString.parse(Gender.Male));
                                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                                          // prefs.setString("GenderKey", _selectedItem);
                                        },
                                      ),
                                      RadioListTile(
                                        activeColor: kColorPrimary,
                                        title: const Text("Female"),
                                        value: Gender.Female,
                                        groupValue: selectedGender,
                                        onChanged: (Gender? value) async {
                                          setState(() {
                                            selectedGender = Gender.Female;
                                            Navigator.pop(context);
                                            // Navigator.pop(context);
                                            // Navigator.pushNamed(context, '/healthdata');
                                          });
                                          SharedPreferences prefs = await SharedPreferences.getInstance();
                                          prefs.setString("gender", EnumToString.parse(Gender.Female));
                                          // SharedPreferences prefs = await SharedPreferences.getInstance();
                                          // prefs.setString("GenderKey", _selectedItem);
                                        },
                                      ),
                                    ],
                                  )
                              );
                           },
                        ),
                      );
                    }
                  ).then((value) {
                    saveGender();
                  });
                },
                child: Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ListTile(
                    title: Text(
                      "Gender",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Text(
                      "${selectedGender.name}",
                      // "Male",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              Divider(
                height: 1,
                color: Colors.white10,
              ),
              InkWell(
                onTap: () {
                  _datebirth(context);
                },
                child: ListTile(
                  title: Text(
                    "Date of Birth",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(
                    "$DOB",
                    // "$birthdate",
                    // "1990-01-01",
                    style: TextStyle(color: Colors.grey),
                  )
                ),
                // Container(
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "Date of Birth",
                //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                //         ),
                //         Text(
                //           "$birthdate",
                //           // "1990-01-01",
                //           style: TextStyle(color: Colors.grey),
                //         )
                //       ],
                //     )
                // ),
              ),
            ],
          ),
        ),
      );});
    }
}






// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// const kBottomContainerHeight = 80.0;
// const kActiveCardColour = Color(0xFF1D1E33);
// const kInactiveCardColour = Color(0xFF111328);
// const kBottomContainerColour = Color(0xFFEB1555);

// const kLabelTextStyle = TextStyle(
//   fontSize: 18.0,
//   color: Color(0xFF8D8E98),
// );
//
// const kNumberTextStyle = TextStyle(
//   fontSize: 50.0,
//   fontWeight: FontWeight.w900,
// );
//
// const kLargeButtonTextStyle = TextStyle(
//   fontSize: 25.0,
//   fontWeight: FontWeight.bold,
// );
//
// const kTitleTextStyle = TextStyle(
//   fontSize: 50.0,
//   fontWeight: FontWeight.bold,
// );
//
// const kResultTextStyle = TextStyle(
//   color: Color(0xFF24D876),
//   fontSize: 22.0,
//   fontWeight: FontWeight.bold,
// );
//
// const kBMITextStyle = TextStyle(
//   fontSize: 100.0,
//   fontWeight: FontWeight.bold,
// );
//
// const kBodyTextStyle = TextStyle(
//   fontSize: 22.0,
// );

// class IconContent extends StatelessWidget {
//   IconContent({this.icon, this.label});
//
//   final IconData icon;
//   final String label;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Icon(
//           icon,
//           size: 80.0,
//         ),
//         SizedBox(
//           height: 15.0,
//         ),
//         Text(
//           label,
//           style: kLabelTextStyle,
//         )
//       ],
//     );
//   }
// }

// enum Gender {
//   male,
//   female,
// }

// class ReusableCard extends StatelessWidget {
//   ReusableCard({@required this.colour, this.cardChild, this.onPress});
//
//   final Color colour;
//   final Widget cardChild;
//   final Function onPress;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//       child: Container(
//         child: cardChild,
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           color: colour,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       ),
//     );
//   }
// }

// class InputPage extends StatefulWidget {
//   @override
//   _InputPageState createState() => _InputPageState();
// }

// class _InputPageState extends State<InputPage> {
//   Gender selectedGender;
//   int height = 180;
//   int weight = 60;
//   int age = 20;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       initGender();
//     });
//     super.initState();
//   }
//
//   void initGender() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     selectedGender =
//         EnumToString.fromString(Gender.values, prefs.getString("gender"));
//     setState(() {});
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('BMI CALCULATOR'),
//         ),
//         body: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: <Widget>[
//               Expanded(
//                   child: Row(
//                     children: <Widget>[
//                       Expanded(
//                         child: ReusableCard(
//                           onPress: () async {
//                             setState(() {
//                               selectedGender = Gender.male;
//                             });
//                             SharedPreferences prefs = await SharedPreferences.getInstance();
//                             prefs.setString("gender", EnumToString.parse(Gender.male));
//                           },
//                           colour: selectedGender == Gender.male
//                               ? kActiveCardColour
//                               : kInactiveCardColour,
//                           cardChild: IconContent(
//                             icon: FontAwesomeIcons.mars,
//                             label: 'MALE',
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: ReusableCard(
//                           onPress: () async {
//                             setState(() {
//                               selectedGender = Gender.female;
//                             });
//                             SharedPreferences prefs =
//                             await SharedPreferences.getInstance();
//                             prefs.setString(
//                                 "gender", EnumToString.parse(Gender.female));
//                           },
//                           colour: selectedGender == Gender.female
//                               ? kActiveCardColour
//                               : kInactiveCardColour,
//                           cardChild: IconContent(
//                             icon: FontAwesomeIcons.venus,
//                             label: 'FEMALE',
//                           ),
//                         ),
//                       ),
//                     ],
//                   ))
//             ]));
//   }
// }

// Future<void> main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: InputPage(),
//     );
//   }
// }