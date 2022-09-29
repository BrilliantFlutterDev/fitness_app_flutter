import 'package:flutter/material.dart';
import 'package:fitness_app/screens/term_and_condition/term_and_condition.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter_switch/flutter_switch.dart';

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
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.white.withOpacity(0.4),
                        Colors.white.withOpacity(0.4),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10,bottom: 5),
                        child: Row(
                          children: [
                            Text(
                              "Backup & Restore",
                              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Colors.black),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset("assets/images/google.png"),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.asset("assets/images/facebook.png"),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.3,
                            ),
                            Icon(Icons.refresh, color: Color(0xff1ce5c1),)
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Sign in and synchronize your data",
                            style: TextStyle(fontSize: 15, color: Colors.black38),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height*0.37,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.white10.withOpacity(0.4),
                          Colors.white10.withOpacity(0.4),
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
                                    Icons.ads_click, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Remove ads",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.15),
                                Text(
                                  "3950.00",
                                  style: TextStyle(fontSize: 16, color: Colors.black38,decoration: TextDecoration.lineThrough),
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
                                    Icons.alarm, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Reminder",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
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
                                    Icons.timer, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Countdown time",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
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
                                    Icons.restaurant, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Training rest",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.39),
                                Text(
                                  "10 sec",
                                  style: TextStyle(fontSize: 16, color: Color(0xff1ce5c1)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 5),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.surround_sound_outlined, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Sound options",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
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
                          Colors.white10.withOpacity(0.4),
                          Colors.white10.withOpacity(0.4),
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
                                    Icons.water_drop, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Turn on water tracker",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
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
                                    Icons.water_drop, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Drink notification",
                                      style: TextStyle(fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Remind me to drink",
                                      style: TextStyle(fontSize: 13, color: Colors.black38),
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
                    height: MediaQuery.of(context).size.height*0.445,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.white10.withOpacity(0.4),
                          Colors.white10.withOpacity(0.4),
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
                          Padding(
                            padding: EdgeInsets.only(top: 20,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.water_drop, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Sync to Google Fit",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.27),
                                FlutterSwitch(
                                  width: 50,
                                  height: 25,
                                  toggleSize: 10,
                                  value: status2,
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
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Health data",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Metric & imerial units",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.language, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Language options",
                                      style: TextStyle(fontSize: 17, color: Colors.black),
                                    ),
                                    Text(
                                      "Default",
                                      style: TextStyle(fontSize: 13, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.refresh, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Restart progress",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 5),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.mic, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Voice options (TTS)",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
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
                          Colors.white10.withOpacity(0.4),
                          Colors.white10.withOpacity(0.4),
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
                                    Icons.share, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Share with friends",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.star_rate_outlined, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Rate us",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.edit, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Common questions",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.edit, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Feedback",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.remove_red_eye_outlined, color: Colors.black38
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Privacy policy",
                                  style: TextStyle(fontSize: 17, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 5),
                            child: Center(
                              child: Text(
                                "Version 1.0.46A",
                                style: TextStyle(fontSize: 13, color: Colors.black38),
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
    );
  }
}