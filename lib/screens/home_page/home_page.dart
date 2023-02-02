import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/custom_training.dart';
import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
import 'package:fitness_app/screens/home_page/quit_screens/quit_screen.dart';
import 'package:fitness_app/screens/rest_screen/dayrest_screen.dart';
import 'package:fitness_app/screens/rest_screen/rest_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/coming_soon_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../Utils/app_global.dart';
import '../../Utils/modal_progress_hud.dart';
import 'open_activity.dart';
import '../my_activity/WaterTracker/water_tracker.dart';
import '../plan_screen/plan_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {

  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double value = 0;

  late String statusValueChoose;
  late HomeBloc _homeBloc;
  RequestDayData? requestDayData;
  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    if (AppGlobal.dataStoreFromConstantToLDB != 'true') {
      print('>>>>>>> Show Exercise');
      _homeBloc.add(InsertAllExercisesInLocalDBEvent());
      AppGlobal.dataStoreFromConstantToLDB = 'true';
    } else {
      _homeBloc.add(GetAllDaysEvent());
      print('>>>>>>> Show Days');
    }
    AppGlobal.selectedPlan;
  }

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
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
      } else if (state is DataStoredState) {
        _homeBloc.add(GetAllDaysEvent());
      } else if (state is GetAllDaysState) {
        requestDayData = state.dayData;
        value = requestDayData!.exerciseList![0].noOfGlassWaterDrank * 12.5;
      } else if (state is UpdateDayProgressState) {
        dayModelLocalDB = state.dayModelLocalDB;
      }
    }, builder: (context, state) {
      return DefaultTabController(
        length: 2,
        child: ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          progressIndicator: CircularProgressIndicator(),
          child: Scaffold(
            backgroundColor: kColorBG,
            appBar: AppBar(
              // backgroundColor: const Color(0xff1c1b20),
              backgroundColor: kColorBG,
              title: const Text("FIT FITNESS"),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const SelectPlanScreen()));
                  },
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/icons/changeplanupper.svg",
                      height: MediaQuery.of(context).size.height*0.038,
                      color: kColorPrimary,
                    ),
                  ),
                ),
                // IconButton(
                //   icon: const Icon(
                //     Icons.flash_on_rounded,
                //     color: kColorPrimary,
                //   ),
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (BuildContext context) =>
                //                 const SelectPlanScreen()));
                //   },
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const QuitScreen()));
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
                    child: Container(
                      child: SvgPicture.asset(
                        "assets/icons/ads.svg",
                        height: MediaQuery.of(context).size.height*0.04,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                // IconButton(
                //   icon: const Icon(
                //     Icons.ads_click,
                //     color: Colors.white,
                //   ),
                //   onPressed: () {
                //     // do something
                //     // Navigator.push(
                //     //     context,
                //     //     MaterialPageRoute(
                //     //         builder: (BuildContext context) =>
                //     //             const DayRestScreen()
                //     //     ));
                //   },
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const WaterTracker())).then((ma){
                                  print("Value is updated");
                                  _homeBloc.add(GetAllDaysEvent());
                                  print(value);
                    });
                  },
                  child: Container(
                    // height: 8.h,
                    // width: MediaQuery.of(context).size.width * 0.2,
                    // margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: SleekCircularSlider(
                      initialValue: value,
                      max: 100,
                      appearance: CircularSliderAppearance(
                        // infoProperties: InfoProperties(),
                        angleRange: 360,
                        size: MediaQuery.of(context).size.width * 0.15,
                        customWidths: CustomSliderWidths(
                            progressBarWidth: 3.0, trackWidth: 3.0),
                        customColors: CustomSliderColors(
                          hideShadow: true,
                          progressBarColor: kColorPrimary,
                          dotColor: Colors.transparent,
                          // trackColor: Colors.white70,
                          trackColor: Colors.white,
                          progressBarColors: [
                            Colors.blue,
                            Colors.blue,
                          ],
                        ),
                      ),
                      innerWidget: (re) {
                        return Center(
                          child: SvgPicture.asset(
                            "assets/icons/waterglass.svg",
                            height: MediaQuery.of(context).size.height*0.02,
                            color: Colors.blue,
                          ),
                          // Icon(
                          //   Icons.water_drop_outlined,
                          //   color: Colors.blue,
                          //   size: 18,
                          // ),
                        );
                      },
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: (AppGlobal.selectedPlan=='1'?'BEGINNER':AppGlobal.selectedPlan=='2'?'INTERMEDIATE':AppGlobal.selectedPlan=='3'?'ADVANCED':'PLAN NAME'),
                    // text: ("PLAN NAME"),
                  ),
                  Tab(
                    text: ("MY TRAINING"),
                  ),
                ],
                indicatorColor: Colors.transparent,
                labelColor: kColorPrimary,
                unselectedLabelColor: Colors.grey,
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            body: ColorRemover(
              child: TabBarView(children: [
                ColorRemover(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: requestDayData != null
                          ? requestDayData!.exerciseList!.length
                          : 0,
                      itemBuilder: (ctx, index) {
                        DayModelLocalDB exercise = requestDayData!.exerciseList![index];
                        print('>>>>>>>> isRest: ${exercise.isRest} ');
                        if (exercise.isRest == 1){
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => DayRestScreen()
                                  ));
                                },
                                child: Container(
                                  height: 10.h,
                                  width: MediaQuery.of(context).size.width * 2,
                                  margin: const EdgeInsets.only(
                                      left: 12, right: 12, top: 12),
                                  child: Container(
                                    height: 10.h,
                                    width: MediaQuery.of(context).size.width * 2,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Color(0xff1c1b20),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          requestDayData!
                                              .exerciseList![index].name,
                                          style: const TextStyle(
                                              fontSize: 25.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: 8.h,
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          margin: const EdgeInsets.symmetric(vertical: 5),
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/icons/coffecup.svg",
                                              height: MediaQuery.of(context).size.height*0.045,
                                              color: kColorPrimary,
                                            ),
                                          ),
                                        ),
                                        // Container(
                                        //   height: 8.h,
                                        //   width: MediaQuery.of(context).size.width * 0.2,
                                        //   margin: const EdgeInsets.symmetric(vertical: 5),
                                        //   child: CircleAvatar(
                                        //     radius: 15,
                                        //     backgroundColor: Colors.transparent,
                                        //       child: Container(
                                        //         child: SvgPicture.asset(
                                        //           "assets/icons/coffeecup.svg",
                                        //           height: MediaQuery.of(context).size.height*0.02,
                                        //           color: kColorPrimary,
                                        //         ),
                                        //       ),
                                        //     // Icon(Icons.energy_savings_leaf_outlined, color: kColorPrimary, size: 30,),
                                        //   ),
                                        // ),
                                        // Container(
                                        //   height: 8.h,
                                        //   width:
                                        //   MediaQuery.of(context).size.width *
                                        //       0.2,
                                        //   margin: const EdgeInsets.symmetric(
                                        //       vertical: 5),
                                        //   child: SleekCircularSlider(
                                        //     initialValue: requestDayData!
                                        //         .exerciseList![index]
                                        //         .completedPercentage
                                        //         .toDouble(),
                                        //     max: 100,
                                        //     appearance: CircularSliderAppearance(
                                        //       // infoProperties: InfoProperties(),
                                        //       angleRange: 360,
                                        //       size: MediaQuery.of(context)
                                        //           .size
                                        //           .width *
                                        //           0.2,
                                        //       customWidths: CustomSliderWidths(
                                        //           progressBarWidth: 6.0,
                                        //           trackWidth: 3.0),
                                        //       customColors: CustomSliderColors(
                                        //         hideShadow: true,
                                        //         progressBarColor:
                                        //         const Color(0xff1ce5c1),
                                        //         dotColor: Colors.transparent,
                                        //         trackColor: Colors.white70,
                                        //         // trackColor: const Color(0xff404040),
                                        //         progressBarColors: [
                                        //           const Color(0xff1ce5c1),
                                        //           const Color(0xff1ce5c1),
                                        //         ],
                                        //       ),
                                        //     ),
                                        //     innerWidget: (re) {
                                        //       return Center(
                                        //         child: Column(
                                        //           mainAxisAlignment:
                                        //           MainAxisAlignment.center,
                                        //           children: [
                                        //             Text(
                                        //               "${requestDayData!.exerciseList![index].completedPercentage}%",
                                        //               style: const TextStyle(
                                        //                 fontSize: 18,
                                        //                 color: Colors.grey,
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       );
                                        //     },
                                        //     // onChange: (e) {
                                        //     //   // setState(() {
                                        //     //   //   vaule = e;
                                        //     //   // });
                                        //     // },
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/${requestDayData!.exerciseList![index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              constants.days.length - 1 == index ?
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.15,
                                  right: MediaQuery.of(context).size.width * 0.15,
                                  top: 10),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                context) =>
                                                const SelectPlanScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kColorBG,
                                            child:
                                            // Image.asset(
                                            //   'assets/icons/change_plan_icon.png',
                                            // ),
                                            // Icon(
                                            //     Icons.change_circle_outlined,
                                            //     color: kColorFG
                                            // ),
                                            Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/changeplanbottom.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.015,
                                          ),
                                          const Text(
                                            "Change Plan",
                                            style: TextStyle(fontSize: 10, color: kColorPrimary),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // requestDayData!.exerciseList![index].completedPercentage.truncate();
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (BuildContext context) =>
                                        //         const SelectPlanScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kColorBG,
                                            child:
                                            Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/reset.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Icon(
                                            //     Icons.refresh,
                                            //     color: kColorFG
                                            // ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.015,
                                          ),
                                          const Text(
                                            "Restart",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: kColorPrimary),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox(),
                            ],
                          );
                        }else{
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => OpenActivity(
                                        dayModelLocalDB: requestDayData!.exerciseList![index],
                                      )));
                                },
                                child: Container(
                                  height: 10.h,
                                  width: MediaQuery.of(context).size.width * 2,
                                  margin: const EdgeInsets.only(left: 12, right: 12, top: 12),
                                  child: Container(
                                    height: 10.h,
                                    width: MediaQuery.of(context).size.width * 2,
                                    padding: const EdgeInsets.symmetric(horizontal: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      gradient: const LinearGradient(
                                        begin: Alignment.topRight,
                                        end: Alignment.topLeft,
                                        colors: [
                                          Color(0xff1c1b20),
                                          Colors.transparent,
                                        ],
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          requestDayData!.exerciseList![index].name,
                                          style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                                        ),
                                        Container(
                                          height: 8.h,
                                          width: MediaQuery.of(context).size.width * 0.2,
                                          margin: const EdgeInsets.symmetric(vertical: 5),
                                          child: SleekCircularSlider(
                                            initialValue: requestDayData!.exerciseList![index].completedPercentage.toDouble(),
                                            max: 100,
                                            appearance: CircularSliderAppearance(
                                              // infoProperties: InfoProperties(),
                                              angleRange: 360,
                                              size: MediaQuery.of(context).size.width * 0.2,
                                              customWidths: CustomSliderWidths(
                                                  progressBarWidth: 6.0,
                                                  trackWidth: 3.0),
                                              customColors: CustomSliderColors(
                                                hideShadow: true,
                                                progressBarColor: kColorPrimary,
                                                dotColor: Colors.transparent,
                                                trackColor: Colors.white70,
                                                // trackColor: const Color(0xff404040),
                                                progressBarColors: [
                                                  kColorPrimary,
                                                  kColorPrimary,
                                                ],
                                              ),
                                            ),
                                            innerWidget: (re) {
                                              return Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "${requestDayData!.exerciseList![index].completedPercentage}%",
                                                      style: const TextStyle(
                                                        fontSize: 18,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                            // onChange: (e) {
                                            //   // setState(() {
                                            //   //   vaule = e;
                                            //   // });
                                            // },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/${requestDayData!.exerciseList![index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              constants.days.length - 1 == index
                                ? Padding(
                                  padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width * 0.15,
                                    right: MediaQuery.of(context).size.width * 0.15,
                                    top: 10
                                  ),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext
                                                context) =>
                                                const SelectPlanScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kColorFG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/changeplanbottom.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Image.asset(
                                            //   'assets/icons/change_plan_icon.png',
                                            // ),
                                            // Icon(
                                            //     Icons.change_circle_outlined,
                                            //     color: kColorPrimary
                                            // ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.015,
                                          ),
                                          const Text(
                                            "Change Plan",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: kColorPrimary
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        _homeBloc.add(ChangeExerciseStatusToResetEvent());
                                        _homeBloc.add(GetAllDaysEvent());
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 15,
                                            backgroundColor: kColorFG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/reset.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Icon(
                                            //     Icons.refresh,
                                            //     color: kColorPrimary
                                            // ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context).size.height * 0.015,
                                          ),
                                          const Text(
                                            "Restart",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: kColorPrimary
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                                  : SizedBox(),
                            ],
                          );
                        }
                      }),
                ),
                ColorRemover(
                  child: Center(
                    child: InkWell(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (_) => Dialog(
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.3,
                                child: ComingSoonPopup(),
                              ),
                            ));
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (BuildContext context) =>
                        //             CustomTraining()));
                      },
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.25,
                                bottom: 13),
                            child: Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        // color: Colors.white,
                                        // width: 2.0,
                                        ),
                                    borderRadius: BorderRadius.circular(100),
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
                                  '+',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 35),
                                ))),
                          ),
                          Text(
                            'Add exercise',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 5,
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1),
                            child: Text(
                              'Customize your own training plans based on your preferences',
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                // ColorRemover(
                //   child: ListView.builder(
                //       // shrinkWrap: true,
                //       physics: const BouncingScrollPhysics(),
                //       itemCount: constants.standard.length,
                //       itemBuilder: (ctx, index) {
                //         return GestureDetector(
                //           onTap: () {
                //             Navigator.of(context).push(
                //               MaterialPageRoute(
                //                 builder: (ctx) => const OpenHomePage(),
                //               ),
                //             );
                //           },
                //           child: Container(
                //             height: 10.h,
                //             width: MediaQuery.of(context).size.width * 2,
                //             margin: const EdgeInsets.all(12),
                //             child: Container(
                //               height: 10.h,
                //               width: MediaQuery.of(context).size.width * 2,
                //               padding: const EdgeInsets.symmetric(horizontal: 10),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12.0),
                //                 gradient: const LinearGradient(
                //                   begin: Alignment.topRight,
                //                   end: Alignment.topLeft,
                //                   colors: [
                //                     Color(0xff1c1b20),
                //                     Colors.white70,
                //                   ],
                //                 ),
                //               ),
                //               child: Row(
                //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                 children: [
                //                   Row(
                //                     children: [
                //                       Container(
                //                         height: 8.h,
                //                         width:
                //                             MediaQuery.of(context).size.width * 0.2,
                //                         margin:
                //                             const EdgeInsets.symmetric(vertical: 5),
                //                         decoration: new BoxDecoration(
                //                           color: kColorPrimary,
                //                           // image: new DecorationImage(
                //                           //     image: '', fit: BoxFit.cover),
                //                           shape: BoxShape.circle,
                //                         ),
                //                         child: Center(
                //                           child: const Icon(
                //                             Icons.timer,
                //                             color: Colors.black,
                //                             size: 35,
                //                           ),
                //                         ),
                //                       ),
                //                       const SizedBox(
                //                         width: 15,
                //                       ),
                //                       Column(
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         mainAxisAlignment: MainAxisAlignment.center,
                //                         children: [
                //                           Text(
                //                             constants.standard[index].name,
                //                             style: const TextStyle(
                //                                 fontSize: 20.0,
                //                                 color: Colors.black,
                //                                 fontWeight: FontWeight.bold),
                //                           ),
                //                           Text(
                //                             '1 Exercise',
                //                             style: const TextStyle(
                //                               fontSize: 20.0,
                //                               color: Colors.black,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ],
                //                   ),
                //                   Container(
                //                       width: 60,
                //                       height: 20,
                //                       child: Center(
                //                         child: Padding(
                //                           padding: const EdgeInsets.symmetric(
                //                               horizontal: 5),
                //                           child: DropdownButton(
                //                             isExpanded: true,
                //                             underline: const SizedBox(),
                //                             dropdownColor: Colors.white,
                //                             icon: const Icon(
                //                               Icons.menu,
                //                               color: kColorPrimary,
                //                               size: 22,
                //                             ),
                //                             iconSize: 20,
                //                             style: const TextStyle(
                //                               fontSize: 15,
                //                               color: Colors.black,
                //                             ),
                //                             onChanged: (valueItem) {},
                //                             items: statusList.map((valueItem) {
                //                               return DropdownMenuItem(
                //                                 child: Text(valueItem),
                //                                 value: valueItem,
                //                                 onTap: () {
                //                                   setState(() {});
                //                                 },
                //                               );
                //                             }).toList(),
                //                           ),
                //                         ),
                //                       )),
                //                   // IconButton(
                //                   //   icon: const Icon(
                //                   //     Icons.menu,
                //                   //     color: kColorPrimary,
                //                   //   ),
                //                   //   onPressed: () {
                //                   //     setState(() {
                //                   //       Container(
                //                   //         height: 102,
                //                   //         width: 35,
                //                   //         child: DropdownButton<String>(
                //                   //             items: statusList.map((String val) {
                //                   //               return DropdownMenuItem<String>(
                //                   //                 value: val,
                //                   //                 child: Text(val),
                //                   //               );
                //                   //             }).toList(),
                //                   //             hint: Text('dadsa'),
                //                   //             onChanged: (val) {
                //                   //               setState(() {});
                //                   //             }),
                //                   //       );
                //                   //     });
                //                   //   },
                //                   // ),
                //                 ],
                //               ),
                //             ),
                //             decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(12.0),
                //               image: DecorationImage(
                //                 image: AssetImage(
                //                     "assets/images/${constants.standard[index].image}"),
                //                 fit: BoxFit.cover,
                //               ),
                //             ),
                //           ),
                //         );
                //       }),
                // ),
              ]),
            ),
            // body:
          ),
        ),
      );
    });
  }
}
