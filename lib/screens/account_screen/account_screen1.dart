import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/user_data_model.dart';
import 'package:fitness_app/screens/CommonQuestions/common_questions.dart';
import 'package:fitness_app/screens/Feedback/feedback.dart';
import 'package:fitness_app/screens/account_screen/GeneralSettings/health_data.dart';
import 'package:fitness_app/screens/account_screen/GeneralSettings/metric_imperial_units.dart';
import 'package:fitness_app/screens/account_screen/Workout/training_rest_popup.dart';
import 'package:fitness_app/screens/reminder_screen/notification_service.dart';
import 'package:fitness_app/screens/reminder_screen/reminder_screen.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/screens/term_and_condition/term_and_condition.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fitness_app/constants/constants.dart';

import '../../constants/colors.dart';

import 'AccountScreenBloc/account_screen_bloc.dart';
import 'Workout/countdown_time_popup.dart';
import 'package:share_plus/share_plus.dart';

import 'dart:io';
import 'package:in_app_review/in_app_review.dart';

enum Availability { loading, available, unavailable }

class AccountScreen1 extends StatefulWidget {
  const AccountScreen1({Key? key}) : super(key: key);

  @override
  State<AccountScreen1> createState() => _AccountScreen1State();
}

class _AccountScreen1State extends State<AccountScreen1> {

  NotificationServices notificationServices = NotificationServices();

  final InAppReview _inAppReview = InAppReview.instance;

  String _appStoreId = '';
  String _microsoftStoreId = '';
  Availability _availability = Availability.loading;

  UserConstants constants = UserConstants();

  bool status = false;
  bool status1 = false;
  bool status2 = false;

  int countresult = 10;
  int restresult = 10;

  @override
  void initState() {
    super.initState();
    _accountScreenBloc = BlocProvider.of<AccountScreenBloc>(context);
    // _accountScreenBloc.add(GetASpecificDaysEvent(day: 'Day ${AppGlobal.currentDay + 1}'));

    notificationServices.initialiseNotifications();

    (<T>(T? o) => o!)(WidgetsBinding.instance).addPostFrameCallback((_) async {
      try {
        final isAvailable = await _inAppReview.isAvailable();

        setState(() {
          _availability = isAvailable && !Platform.isAndroid
              ? Availability.available
              : Availability.unavailable;
        });
      } catch (_) {
        setState(() => _availability = Availability.unavailable);
      }
    });
  }

  void _setAppStoreId(String id) => _appStoreId = id;
  void _setMicrosoftStoreId(String id) => _microsoftStoreId = id;

  Future<void> _requestReview() => _inAppReview.requestReview();

  Future<void> _openStoreListing() => _inAppReview.openStoreListing(
    appStoreId: _appStoreId,
    microsoftStoreId: _microsoftStoreId,
  );


  Future<void> _navigatecount(BuildContext context) async {
    var _countresult1 = await showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: CountdownPopup()
          ),
        )
    );
    setState(() {
      countresult = _countresult1;
    });
    if (!mounted) return;//CountdownPopup(),
  }

  Future <void> _navigaterest(BuildContext context) async {
    var _restresult1 = await showDialog(
        context: context,
        builder: (_) => Dialog(
          child: Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: TrainingRestPopup( )
          ),
        ),
    );
    setState(() {
      restresult = _restresult1;
    });
    if (!mounted) return;
  }

  late AccountScreenBloc _accountScreenBloc;
  // late HomeBloc _homeBloc;
  RequestDayData? requestDayData;
  DayModelLocalDB? dayModelLocalDB;
  RequestUserData? requestUserData;

  @override
  Widget build(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<AccountScreenBloc, AccountScreenState>(listener: (context, state) {
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
      } else if (state is DataStoredState) {
        _accountScreenBloc.add(InsertAllUserDataInLocalDBEvent());
      }
      // else if (state is GetAllDaysState) {
      //   requestDayData = state.dayData;
      // }
      else if (state is UpdateDayProgressState) {
        dayModelLocalDB = state.dayModelLocalDB;
      }
    },
    //   BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
    //   if (state is LoadingState) {
    //   } else if (state is ErrorState) {
    //     Fluttertoast.showToast(
    //         msg: state.error,
    //         toastLength: Toast.LENGTH_SHORT,
    //         gravity: ToastGravity.BOTTOM,
    //         timeInSecForIosWeb: 1,
    //         backgroundColor: Colors.grey.shade400,
    //         textColor: Colors.white,
    //         fontSize: 12.0);
    //   } else if (state is RefreshScreenState) {
    //   }else if (state is DataStoredState) {
    //     _homeBloc.add(GetAllDaysEvent());
    //   }else if (state is GetAllDaysState) {
    //     requestDayData = state.dayData;
    //   }
    // },
    builder: (context, state) {
     return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("ME"),
        ),
      body: ColorRemover(
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
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration:
                  // BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //         "assets/images/${constants.dailyExercises[2].image}"),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WORKOUT",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: kColorPrimary),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      Icons.ads_click, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                  Text(
                                    "Remove ads",
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "3950.00",
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.043, color: Colors.grey, decoration: TextDecoration.lineThrough),
                                  ),
                                  SizedBox(width: 5),
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
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => ReminderScreen(id: 1, content: 'Your body need energy! You did not exercise for 2 days', title: '', ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                        Icons.alarm, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.036),
                                    Text(
                                      "Reminder",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "19:00",
                                      style: TextStyle(fontSize: 16, color: kColorPrimary),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                        Icons.add,color: kColorPrimary, size: MediaQuery.of(context).size.width*0.065
                                    )
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _navigatecount(context);
                          },
                          // {
                          //   Future<void> _navigatecount(BuildContext context) async {
                          //   final countresult = await showDialog(
                          //           context: context,
                          //           builder: (_) => Dialog(
                          //             child: Container(
                          //                 height: MediaQuery.of(context).size.height*0.4,
                          //               child: CountdownPopup()
                          //             ),
                          //       )
                          //     );//CountdownPopup(),
                          // }
                          //   if (!mounted) return;
                          // },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                        Icons.timer, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                    Text(
                                      "Countdown time",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      // '${_accountScreenBloc.add(InsertAllUserDataInLocalDBEvent())}',
                                      // '${requestUserData?.userDataList?[0].countDownTime}',
                                      '${countresult} sec',
                                      // "10 sec",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.043, color: kColorPrimary),
                                    ),
                                    Icon(
                                        Icons.arrow_drop_down,
                                        color: kColorPrimary, size: MediaQuery.of(context).size.width*0.065
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: ()
                          {
                            _navigaterest(context);
                            // showDialog(
                            //     context: context,
                            //     builder: (_) => Dialog(
                            //       child: Container(
                            //           height: MediaQuery.of(context).size.height*0.4,
                            //           child: TrainingRestPopup()
                            //       ),
                            //     )
                            // );//CountdownPopup(),
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                        Icons.restaurant, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                    Text(
                                      "Training rest",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      // '${requestUserData?.userDataList?[0].trainingRest.toString()}',
                                      // '${GetUserTrainingDataEvent(trainRest: 10)}',
                                      // '${requestUserData?.userDataList?[0].trainingRest}',
                                      '${restresult} sec',
                                      // "10 sec",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.043, color: kColorPrimary),
                                    ),
                                    Icon(
                                        Icons.arrow_drop_down, color: kColorPrimary, size: MediaQuery.of(context).size.width*0.065
                                    )
                                  ],
                                ),

                              ],
                            ),
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
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration:
                  // BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //         "assets/images/${constants.dailyExercises[2].image}"),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 10, top: 10, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "WATER TRACKER SETTINGS",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: kColorPrimary),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 18,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                      Icons.water_drop, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                  Text(
                                    "Turn on water tracker",
                                    style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                  ),
                                ],
                              ),
                              FlutterSwitch(
                                activeColor: kColorPrimary,
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
                        Visibility(
                          visible: status,
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                        Icons.water_drop, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                    ),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Drink notification",
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                        ),
                                        Text(
                                          "Remind me to drink",
                                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.04, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                FlutterSwitch(
                                  activeColor: kColorPrimary,
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
                                    if (status1){
                                      notificationServices.sheduleNotification("Reminder", "Drink Water");
                                    }else{
                                      notificationServices.stopNotification();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration:
                  // BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //         "assets/images/${constants.dailyExercises[2].image}"),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.8),
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: kColorPrimary),
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
                          padding: EdgeInsets.only(top: 18,bottom: 10),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => HealthData(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Health data",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 10),
                          child: InkWell(
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => MetricImperialUnits(),
                                ),
                              );
                            },
                            child: Row(
                              children: [
                                Icon(
                                    Icons.health_and_safety, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Metric & imperial units",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
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
                        InkWell(
                          onTap: () {
                            _accountScreenBloc.add(ChangeExerciseStatusToResetEvent());
                            // requestDayData!.exerciseList!.setAll(index, iterable);
                            // requestDayData!.exerciseList![index].completedPercentage.truncate();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.refresh, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Restart progress",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
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
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.all(10),
                  decoration:
                  // BoxDecoration(
                  //   borderRadius: BorderRadius.circular(8.0),
                  //   image: DecorationImage(
                  //     image: AssetImage(
                  //         "assets/images/${constants.dailyExercises[2].image}"),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.black.withOpacity(0.8),
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
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: kColorPrimary),
                        ),
                        InkWell(
                          onTap: () {
                            Share.share('check out my App https://example.com', subject: 'Look what I made!');
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 18,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.share, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Share with friends",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _requestReview();
                            _openStoreListing();
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.star_rate_outlined, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Rate us",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => FAQ(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.edit, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Common questions",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => UserFeedback(),
                              ),
                            );
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.edit, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Feedback",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(top: 10,bottom: 10),
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //           Icons.edit, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                        //       ),
                        //       SizedBox(width: MediaQuery.of(context).size.width*0.035),
                        //       Text(
                        //         "Feedback",
                        //         style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        TermAndCondition()));
                          },
                          child: Padding(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              children: [
                                Icon(
                                    Icons.remove_red_eye_outlined, color: Colors.white, size: MediaQuery.of(context).size.width*0.065,
                                ),
                                SizedBox(width: MediaQuery.of(context).size.width*0.035),
                                Text(
                                  "Privacy policy",
                                  style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.045, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10,bottom: 5),
                          child: Center(
                            child: Text(
                              "Version 1.0.0",
                              style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.042, color: Colors.grey),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.1,),
            ],
          ),
        ),
      ),
    );});
  }
}