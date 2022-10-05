import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/term_and_condition/term_and_condition.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AccountScreen1 extends StatefulWidget {
  @override
  State<AccountScreen1> createState() => _AccountScreen1State();
}

class _AccountScreen1State extends State<AccountScreen1> {

  bool status = false;
  bool status1 = false;
  bool status2 = false;

  @override
  Widget build(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
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
          title: const Text("ME"),
        ),
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                // Container(
                //   height: MediaQuery.of(context).size.height*0.1,
                //   width: MediaQuery.of(context).size.width,
                //   margin: EdgeInsets.all(10),
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(8.0),
                //     gradient: LinearGradient(
                //       begin: Alignment.topRight,
                //       end: Alignment.topLeft,
                //       colors: [
                //         Colors.grey.withOpacity(0.8),
                //         Colors.grey.withOpacity(0.8),
                //       ],
                //     ),
                //   ),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       Padding(
                //         padding: EdgeInsets.only(left: 10, top: 10,bottom: 5),
                //         child: Row(
                //           children: [
                //             Text(
                //               "Backup & Restore",
                //               style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Colors.white),
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             CircleAvatar(
                //               radius: 10,
                //               backgroundColor: Colors.grey.shade300,
                //               child: Padding(
                //                 padding: const EdgeInsets.all(2.0),
                //                 child: Image.asset("assets/images/google.png"),
                //               ),
                //             ),
                //             SizedBox(
                //               width: 5,
                //             ),
                //             CircleAvatar(
                //               radius: 10,
                //               backgroundColor: Colors.grey.shade300,
                //               child: Padding(
                //                 padding: const EdgeInsets.all(2.0),
                //                 child: Image.asset("assets/images/facebook.png"),
                //               ),
                //             ),
                //             SizedBox(
                //               width: MediaQuery.of(context).size.width*0.3,
                //             ),
                //             Icon(Icons.refresh, color: Color(0xff1ce5c1),)
                //           ],
                //         ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 8),
                //         child: Text(
                //           "Sign in and synchronize your data",
                //             style: TextStyle(fontSize: 15, color: Colors.white10),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
                Container(
                    height: MediaQuery.of(context).size.height*0.31,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.grey.withOpacity(0.8),
                          Colors.grey.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WORKOUT",
                            style: TextStyle(fontSize: 17, color: Color(0xff1ce5c1)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.ads_click, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Remove ads",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.15),
                                Text(
                                  "3950.00",
                                  style: TextStyle(fontSize: 16, color: Colors.white10,decoration: TextDecoration.lineThrough),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  height: 28,
                                  width: MediaQuery.of(context).size.width*0.22,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    gradient: LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.topLeft,
                                      colors: [
                                        Color(0xff1ce5c1).withOpacity(0.9),
                                        Color(0xff1ce5c1).withOpacity(0.9),
                                      ],
                                    ),
                                  ),
                                  child: Text(
                                    "Rs 790.00",
                                    style: TextStyle(fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.alarm, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Reminder",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.41),
                                Text(
                                  "19:00",
                                  style: TextStyle(fontSize: 16, color: Color(0xff1ce5c1)),
                                ),
                                Icon(Icons.add,color: Color(0xff1ce5c1))
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.timer, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Countdown time",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.3),
                                Text(
                                  "10 sec",
                                  style: TextStyle(fontSize: 16, color: Color(0xff1ce5c1)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.restaurant, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Training rest",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.39),
                                Text(
                                  "10 sec",
                                  style: TextStyle(fontSize: 16, color: Color(0xff1ce5c1)),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 10,bottom: 5),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //           Icons.surround_sound_outlined, color: Colors.white
                          //       ),
                          //       //SizedBox(width: MediaQuery.of(context).size.width*0.035),
                          //       // Text(
                          //       //   "Sound options",
                          //       //   style: TextStyle(fontSize: 17, color: Colors.white),
                          //       // ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.2,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.grey.withOpacity(0.8),
                          Colors.grey.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "WATER TRACKER SETTINGS",
                            style: TextStyle(fontSize: 17, color: Color(0xff1ce5c1)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.water_drop, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Turn on water tracker",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.2),
                                FlutterSwitch(
                                  width: 50,
                                  height: 25,
                                  toggleSize: 10,
                                  value: status,
                                  borderRadius: 30,
                                  padding: 8.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      status = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.water_drop, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Drink notification",
                                      style: TextStyle(fontSize: 17, color: Colors.white),
                                    ),
                                    Text(
                                      "Remind me to drink",
                                      style: TextStyle(fontSize: 13, color: Colors.white10),
                                    ),
                                  ],
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.29),
                                FlutterSwitch(
                                  width: 50,
                                  height: 25,
                                  toggleSize: 10,
                                  value: status1,
                                  borderRadius: 30,
                                  padding: 8.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      status1 = val;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.23,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.grey.withOpacity(0.8),
                          Colors.grey.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "GENERAL SETTINGS",
                            style: TextStyle(fontSize: 17, color: Color(0xff1ce5c1)),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 20,bottom: 10),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //           Icons.water_drop, color: Colors.white
                          //       ),
                          //       SizedBox(width: MediaQuery.of(context).size.width*0.035),
                          //       Text(
                          //         "Sync to Google Fit",
                          //         style: TextStyle(fontSize: 17, color: Colors.white),
                          //       ),
                          //       SizedBox(width: MediaQuery.of(context).size.width*0.27),
                          //       FlutterSwitch(
                          //         width: 50,
                          //         height: 25,
                          //         toggleSize: 10,
                          //         value: status2,
                          //         borderRadius: 30,
                          //         padding: 8.0,
                          //         showOnOff: false,
                          //         onToggle: (val) {
                          //           setState(() {
                          //             status1 = val;
                          //           });
                          //         },
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Health data",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Metric & imerial units",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 10,bottom: 10),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //           Icons.language, color: Colors.white
                          //       ),
                          //       SizedBox(width: MediaQuery.of(context).size.width*0.035),
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         children: [
                          //           Text(
                          //             "Language options",
                          //             style: TextStyle(fontSize: 17, color: Colors.white),
                          //           ),
                          //           Text(
                          //             "Default",
                          //             style: TextStyle(fontSize: 13, color: Colors.white10),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.refresh, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Restart progress",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: EdgeInsets.only(top: 10,bottom: 5),
                          //   child: Row(
                          //     children: [
                          //       Icon(
                          //           Icons.mic, color: Colors.white
                          //       ),
                          //       SizedBox(width: MediaQuery.of(context).size.width*0.035),
                          //       Text(
                          //         "Voice options (TTS)",
                          //         style: TextStyle(fontSize: 17, color: Colors.white),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    )
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.42,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.grey.withOpacity(0.8),
                          Colors.grey.withOpacity(0.8),
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "SUPPORT US",
                            style: TextStyle(fontSize: 17, color: Color(0xff1ce5c1)),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.share, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Share with friends",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.star_rate_outlined, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Rate us",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.edit, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Common questions",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.edit, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Feedback",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.remove_red_eye_outlined, color: Colors.white
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Privacy policy",
                                  style: TextStyle(fontSize: 17, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 5),
                            child: Center(
                              child: Text(
                                "Version 1.0.46A",
                                style: TextStyle(fontSize: 13, color: Colors.white10),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                ),
              ],
            ),
          ),
        )
      ),
    );});
  }
}