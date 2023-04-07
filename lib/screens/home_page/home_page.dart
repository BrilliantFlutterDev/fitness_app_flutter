import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/my_activity/WaterTracker/animated_drinking_screen.dart';
import 'package:fitness_app/screens/rest_screen/dayrest_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/coming_soon_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import '../../Utils/app_global.dart';
import '../../Utils/gif_download.dart';
import '../../Utils/modal_progress_hud.dart';
import 'open_activity.dart';
import '../my_activity/WaterTracker/water_tracker.dart';
import '../plan_screen/plan_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double value = 0;
  double previousValue = 0;

  late String statusValueChoose;
  late HomeBloc _homeBloc;
  RequestDayData? requestDayData;
  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;

  AdmobHelper admobHelper = AdmobHelper();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

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
    analytics.setCurrentScreen(screenName: "Home Screen");
  }

  @override
  Widget build(BuildContext context) {
    Constants constants = Constants();
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
        previousValue = double.parse(requestDayData!.exerciseList![0].noOfGlassWaterDrank.toString());
        value = requestDayData!.exerciseList![AppGlobal.currentDay].noOfGlassWaterDrank * 12.5;

        // List days = requestDayData!.exerciseList!;
        // for(int i=1; i<=requestDayData!.exerciseList!.length; i++){
        //   if(i/7 == 0){
        //     days.add('value');
        //   }
        // }
        // requestDayData = days as RequestDayData?;
      } else if (state is UpdateDayProgressState) {
        dayModelLocalDB = state.dayModelLocalDB;
      }
    }, builder: (context, state) {
      return DefaultTabController(
        length: 2,
        child: ModalProgressHUD(
          inAsyncCall: state is LoadingState,
          progressIndicator: const CircularProgressIndicator(),
          color: Colors.transparent,
          child: Scaffold(
            backgroundColor: kColorBG,
            appBar: AppBar(
              toolbarHeight: MediaQuery.of(context).size.height*0.11,
              // backgroundColor: const Color(0xff1c1b20),
              backgroundColor: kColorBG,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      "\nDAILY WEIGHT LOSS",
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.06, color: kColorPrimary),
                  ),
                  Text(
                      "HOME WORKOUT",
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.055),
                  ),
                ],
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const SelectPlanScreen()));
                  },
                  child: SvgPicture.asset(
                    "assets/icons/changeplanupper.svg",
                    height: MediaQuery.of(context).size.height*0.03,
                    color: kColorPrimary,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.01),

                InkWell(
                  onTap: () {
                    // admobHelper.loadInterstatialAd();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                            const GifDownloadScreen()
                        )
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.04),
                    child: SvgPicture.asset(
                      "assets/icons/ads.svg",
                      height: MediaQuery.of(context).size.height*0.032,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width*0.01),

                InkWell(
                  onTap: () {
                    if (value == 100 || value > 100) {
                      value = 100;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                              const WaterTracker()
                          )
                      ).then((ma){
                        print("Value is updated");
                        _homeBloc.add(GetAllDaysEvent());
                        print(value);
                      });
                    } else {
                      _homeBloc.add(
                          WaterGlassIncrementDecrementEvent(
                              dayData: requestDayData!, isIncrementing: true)
                      );
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AnimatedDrinkAcknowledge(previousValue: previousValue)
                          )
                      ).then((ma){
                        print("Value is updated");
                        _homeBloc.add(GetAllDaysEvent());
                        print(value);
                      });
                    }
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
                        startAngle: 270,
                        angleRange: 360,
                        size: MediaQuery.of(context).size.width * 0.08,
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
                            height: MediaQuery.of(context).size.height*0.017,
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
                SizedBox(width: MediaQuery.of(context).size.width*0.02),
              ],
              bottom: TabBar(
                tabs: [
                  Tab(
                    text: (AppGlobal.selectedPlan=='1'?'BEGINNER':AppGlobal.selectedPlan=='2'?'INTERMEDIATE':AppGlobal.selectedPlan=='3'?'ADVANCED':'PLAN NAME'),
                    // text: ("PLAN NAME"),
                  ),
                  const Tab(
                    text: ("MY TRAINING"),
                  ),
                ],
                indicatorColor: Colors.transparent,
                labelColor: kColorPrimary,
                unselectedLabelColor: Colors.grey,
                labelStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: const TextStyle(
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
                                  admobHelper.loadInterstatialAd();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => const DayRestScreen()
                                  ));
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
                                          kColorPrimary,
                                          Color(0xff1e1e1e),
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
                                          child: Center(
                                            child: SvgPicture.asset(
                                              "assets/icons/dayrest.svg",
                                              height: MediaQuery.of(context).size.height*0.03,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    color: kColorPrimary.withOpacity(0.2),
                                    // image: DecorationImage(
                                    //   image: AssetImage(
                                    //       "assets/images/${requestDayData!.exerciseList![index].image}"),
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ),
                              ),
                              constants.days.length - 1 == index ?
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.15,
                                  right: MediaQuery.of(context).size.width * 0.15,
                                  top: MediaQuery.of(context).size.height * 0.025,
                                  bottom: MediaQuery.of(context).size.height * 0.01
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                const SelectPlanScreen()));
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: kColorBG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/changeplanbottom.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                                          const Text(
                                            "Change Plan",
                                            style: TextStyle(fontSize: 10, color: kColorPrimary),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          // backgroundColor: kColorBG,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder: (BuildContext context,
                                                StateSetter setState /*You can rename this!*/) {
                                              return Padding(
                                                padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                                                child: Container(
                                                  height: MediaQuery.of(context).size.height * 0.35,
                                                  child: Wrap(
                                                    children: [
                                                      const Text(
                                                        "Reset this plan",
                                                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                      ),
                                                      SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                                      const Text(
                                                        "Would you like to clear your progress and restart from Day 1?",
                                                        style: TextStyle(fontSize: 16, color: Colors.white),
                                                      ),
                                                      SizedBox(height: MediaQuery.of(context).size.height*0.15),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Container(
                                                                height: MediaQuery.of(context).size.height * 0.08,
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  color: Colors.white,
                                                                ),
                                                                child: const Center(
                                                                  child: Text(
                                                                    "CANCEL",
                                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: const EdgeInsets.only(left: 10, top: 10),
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                                _homeBloc.add(ChangeExerciseStatusToResetEvent());
                                                                _homeBloc.add(GetAllDaysEvent());
                                                              },
                                                              child: Container(
                                                                height: MediaQuery.of(context).size.height * 0.08,
                                                                width: MediaQuery.of(context).size.width * 0.4,
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(50),
                                                                  color: kColorPrimary,
                                                                ),
                                                                child: const Center(
                                                                  child: Text(
                                                                    "OK",
                                                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                          },
                                        );
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: kColorBG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/restart.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Icon(
                                            //     Icons.refresh,
                                            //     color: kColorFG
                                            // ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
                                          const Text(
                                            "Restart",
                                            style: TextStyle(fontSize: 10, color: kColorPrimary),
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
                        else{
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  admobHelper.loadInterstatialAd();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => OpenActivity(
                                      dayModelLocalDB: requestDayData!.exerciseList![index],
                                    )
                                  ));
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
                                              startAngle: 270,
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
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      // requestDayData!.exerciseList![index].exerciseNumInProgress == exerciseData!.exerciseList!.length
                                                      //     ?
                                                      // "100%" : "${requestDayData!.exerciseList![index].completedPercentage}%",
                                                      "${requestDayData!.exerciseList![index].completedPercentage.ceil()}%",
                                                      style: const TextStyle(fontSize: 18, color: Colors.grey,),
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
                              constants.days.length - 1 == index ?
                              Padding(
                                padding: EdgeInsets.only(
                                  left: MediaQuery.of(context).size.width * 0.15,
                                  right: MediaQuery.of(context).size.width * 0.15,
                                  top: MediaQuery.of(context).size.height * 0.025,
                                  bottom: MediaQuery.of(context).size.height * 0.01
                                ),
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
                                            radius: 20,
                                            backgroundColor: kColorFG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/changeplanbottom.svg",
                                                height: MediaQuery.of(context).size.height*0.02,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Icon(
                                            //     Icons.change_circle_outlined,
                                            //     color: kColorPrimary
                                            // ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
                                          const Text(
                                            "Change Plan",
                                            style: TextStyle(fontSize: 10, color: kColorPrimary),
                                          )
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        showModalBottomSheet(
                                          // backgroundColor: kColorBG,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            return StatefulBuilder(builder: (BuildContext context,
                                              StateSetter setState /*You can rename this!*/) {
                                                return Padding(
                                                  padding: const EdgeInsets.only(top: 30, left: 20, right: 20),
                                                  child: Container(
                                                    height: MediaQuery.of(context).size.height * 0.35,
                                                    child: Wrap(
                                                      children: [
                                                        const Text(
                                                          "Reset this plan",
                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                        ),
                                                        SizedBox(height: MediaQuery.of(context).size.height*0.05),
                                                        const Text(
                                                          "Would you like to clear your progress and restart from Day 1?",
                                                          style: TextStyle(fontSize: 16, color: Colors.white),
                                                        ),
                                                        SizedBox(height: MediaQuery.of(context).size.height*0.15),
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, top: 10),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(context);
                                                                },
                                                                child: Container(
                                                                  height: MediaQuery.of(context).size.height * 0.08,
                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    color: Colors.white,
                                                                  ),
                                                                  child: const Center(
                                                                    child: Text(
                                                                      "CANCEL",
                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding: const EdgeInsets.only(left: 10, top: 10),
                                                              child: InkWell(
                                                                onTap: () {
                                                                  Navigator.pop(context);
                                                                  _homeBloc.add(ChangeExerciseStatusToResetEvent());
                                                                  _homeBloc.add(GetAllDaysEvent());
                                                                },
                                                                child: Container(
                                                                  height: MediaQuery.of(context).size.height * 0.08,
                                                                  width: MediaQuery.of(context).size.width * 0.4,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(50),
                                                                    color: kColorPrimary,
                                                                  ),
                                                                  child: const Center(
                                                                    child: Text(
                                                                      "OK",
                                                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                                                    ),
                                                                  ),
                                                                ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                            );
                                            });
                                        },
                                      );
                                      },
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            radius: 20,
                                            backgroundColor: kColorFG,
                                            child: Container(
                                              child: SvgPicture.asset(
                                                "assets/icons/restart.svg",
                                                height: MediaQuery.of(context).size.height*0.025,
                                                color: kColorPrimary,
                                              ),
                                            ),
                                            // Icon(
                                            //     Icons.refresh,
                                            //     color: kColorPrimary
                                            // ),
                                          ),
                                          SizedBox(height: MediaQuery.of(context).size.height * 0.025,),
                                          const Text(
                                            "Restart",
                                            style: TextStyle(fontSize: 10, color: kColorPrimary),
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
                            padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.25, bottom: 13),
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
