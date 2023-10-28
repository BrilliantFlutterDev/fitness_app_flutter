import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/plan_screen/push_ups_spinner_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

import '../../constants/colors.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  final List<bool> _selectedPlan = <bool>[true, false, false];
  late HomeBloc _homeBloc;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  // BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',   //'<ad unit ID>'
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(
  //     onAdLoaded: (Ad ad){
  //       print('Ad Loaded Sucessfully');
  //
  //     },
  //     onAdFailedToLoad: (Ad ad, LoadAdError error){
  //       print('Ad Loaded Failed');
  //       ad.dispose();
  //     },
  //     onAdOpened: (Ad ad){
  //       print('Ad Opened');
  //     },
  //   ),
  // );

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    addUserData();
    analytics.setCurrentScreen(screenName: "Plan Screen");
  }

  void addUserData() async {
    await storage.write(key: 'selectedPlan', value: '1');
  }

  @override
  Widget build(BuildContext context) {
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
      } else if (state is RefreshScreenState) {}
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
        body: ColorRemover(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height*0.93,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Bell Magic Workout.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kColorBG.withOpacity(0.8),
                              kColorBG.withOpacity(0.8),
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height*0.93,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     const Text(
                              //       "Sign in",
                              //       style: TextStyle(
                              //         fontSize: 18,
                              //         color: Colors.white,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //     InkWell(
                              //       onTap: () {
                              //         // Navigator.of(context).pop();
                              //         Navigator.of(context).push(
                              //             MaterialPageRoute(
                              //                 builder: (ctx) =>
                              //                     const Register()));
                              //       },
                              //       child: Row(
                              //         children: const [
                              //           Text(
                              //             "+ ",
                              //             style: TextStyle(
                              //               fontSize: 18,
                              //               color: kFirstColor,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //           ),
                              //           Text(
                              //             "Register",
                              //             style: TextStyle(
                              //               fontSize: 18,
                              //               color: Colors.white,
                              //               fontWeight: FontWeight.bold,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     )
                              //   ],
                              // ),
                              // RichText(
                              //   text: TextSpan(
                              //     text: 'Sign in\t',
                              //     style: const TextStyle(
                              //       fontFamily: "Bebas",
                              //       fontSize: 20,
                              //     ),
                              //     children: <InlineSpan>[
                              //       WidgetSpan(
                              //           alignment: PlaceholderAlignment.baseline,
                              //           baseline: TextBaseline.alphabetic,
                              //           child: SizedBox(width: 33.w)),
                              //       const TextSpan(
                              //         text: 'ELEMENT',
                              //         style: TextStyle(color: kFirstColor),
                              //       )
                              //     ],
                              //   ),
                              // ),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  Text(
                                    "CHOOSE YOUR PLAN",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Lose weight with the plan that suits you best",
                                    maxLines: 1,
                                    style: TextStyle(fontSize: 15, color: kColorPrimary,),
                                  ),
                                ],
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.07
                              ),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[2] = false;
                                  _selectedPlan[1] = false;
                                  _selectedPlan[0] = true;

                                  if (AppGlobal.selectedPlan != "1"){
                                    AppGlobal.selectedPlan = "1";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedPlan', value: '1'
                                  );
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'BEGINNER',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppGlobal.selectedPlan == '1'
                                              // _selectedPlan[0] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                        Text(
                                          '5-10 min a day',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: AppGlobal.selectedPlan == '1'
                                              // _selectedPlan[0] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          // _selectedPlan[0] == false
                                          AppGlobal.selectedPlan == '1'
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedPlan == '1'
                                          // _selectedPlan[0] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[0] = false;
                                  _selectedPlan[2] = false;
                                  _selectedPlan[1] = true;

                                  if (AppGlobal.selectedPlan != "2"){
                                    AppGlobal.selectedPlan = "2";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedPlan', value: '2');
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 12, right: 12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'INTERMEDIATE',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppGlobal.selectedPlan == '2'
                                              // _selectedPlan[1] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                        Text(
                                          '10-20 min a day',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: AppGlobal.selectedPlan == '2'
                                              // _selectedPlan[1] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.b,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          AppGlobal.selectedPlan == '2'
                                          // _selectedPlan[1] == false
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedPlan == '2'
                                          // _selectedPlan[1] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[0] = false;
                                  _selectedPlan[1] = false;
                                  _selectedPlan[2] = true;

                                  if (AppGlobal.selectedPlan != "3"){
                                    AppGlobal.selectedPlan = "3";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedPlan', value: '3'
                                  );
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'ADVANCED',
                                          style: TextStyle(
                                              fontSize: 20.0,
                                              fontWeight: FontWeight.bold,
                                              color: AppGlobal.selectedPlan == '3'
                                              // _selectedPlan[2] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                        Text(
                                          '15-30 min a day',
                                          style: TextStyle(
                                              fontSize: 15.0,
                                              color: AppGlobal.selectedPlan == '3'
                                              // _selectedPlan[2] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          AppGlobal.selectedPlan == '3'
                                          // _selectedPlan[2] == false
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedPlan == '3'
                                          // _selectedPlan[2] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.1
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const PushUpsSpinnerScreen()
                                      )
                                  );
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            // color: Colors.white,
                                            // width: 2.0,
                                            ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: kColorPrimary,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                    child: const Center(
                                        child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        // ),
      );
    });
  }
}
