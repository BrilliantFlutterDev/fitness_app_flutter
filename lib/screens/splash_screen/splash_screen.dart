import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Utils/app_global.dart';
import '../../Utils/common_functions.dart';
import '../../Utils/modal_progress_hud.dart';
import '../../widgets/cus_bottom_bar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  FlutterSecureStorage storage = const FlutterSecureStorage();
  AdmobHelper admobHelper = AdmobHelper();
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  bool _isDownloading = false;

  @override
  void initState() {
    super.initState();
    checkUserData();
    analytics.setCurrentScreen(screenName: "Splash Screen");
    _isDownloading ? null : _checkIfGifsDownloaded();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(seconds: 5));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    _animation.addListener(() => setState(() {}));
    _animationController.forward();

    Timer(const Duration(seconds: 5), () {
      if (AppGlobal.dataStoreFromConstantToLDB == 'true') {
        admobHelper.loadAppOpenAd();
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const CusBottomBar()),
            (Route<dynamic> route) => false);
      } else {
        admobHelper.loadAppOpenAd();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const SelectPlanScreen()));
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animation.isDismissed; // you need this
    super.dispose();
  }

  void checkUserData() async {
    AppGlobal.dataStoreFromConstantToLDB =
        (await storage.read(key: 'dataStoreFromConstantToLDB'));
    if (AppGlobal.dataStoreFromConstantToLDB == 'true') {
      AppGlobal.selectedPlan = (await storage.read(key: 'selectedPlan'));

      AppGlobal.selectedPushUpOption = (await storage.read(key: 'selectedPushUpOption'));

      AppGlobal.selectedPlankOption = (await storage.read(key: 'selectedPlankOption'));

      AppGlobal.selectedKneeIssueOption = (await storage.read(key: 'selectedKneeIssueOption'));
      var tempDate = await storage.read(key: 'startDate');
      DateTime startDate = DateTime.parse(tempDate!);
      final todayDate = DateTime.now();
      AppGlobal.currentDay = daysBetween(startDate, todayDate);
      if (AppGlobal.currentDay > 30) {
        await storage.write(key: 'startDate', value: todayDate.toString());
        tempDate = await storage.read(key: 'startDate');
        startDate = DateTime.parse(tempDate!);
        AppGlobal.currentDay = daysBetween(startDate, todayDate);
      }
      print('>>>>>>>>>Current Day : ${AppGlobal.currentDay}');
    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Future<void> downloadGifs() async {
    setState(() {
      _isDownloading = true;
    });
    try {
      Dio dio = Dio();
      // String bucketUrl = 'https://fitness-bucket.s3.amazonaws.com/Gifs/';

      List<String> gifs = [
        'https://fitness-bucket.s3.amazonaws.com/Gifs/abdominalCrunch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/backwardLunge.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/bicyclesCrunches.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/burpee.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/buttBridge.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/clapPushUp.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/cobraStretch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/crunchWithLegRaise.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/declinePushUp.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/flutterKicks.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/gluteKickBack.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/heelTouch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/highStepping.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/inchworm.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/jumpingJack.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/kneeToElbow.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/legRaises.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/longArmCrunches.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/lunge.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/mountainClimber.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/plank.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/plankJacks.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/pushUp.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/reclinedObliqueTwist.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/reverseCrunch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/reverseCrunch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/scissors.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/skippingWithoutRope.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/squatPulses.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/squatReachUp.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/squats.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/standingBicycleCrunch.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/stepUpOnChair.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/toySoldiers.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/tricepsDips.gif'
        'https://fitness-bucket.s3.amazonaws.com/Gifs/vUp.gif'
      ];
      // Get app's documents directory
      Directory appDocDir = await getApplicationDocumentsDirectory();
      // for (int i = 0; i < gifs.length; i++) {
      //   String gifUrl = bucketUrl + gifs[i];
      //   http.Response response = await http.get(Uri.parse(gifUrl));
      //   String gifFileName = gifs[i];
      //   File file = File('${appDocDir.path}/images/$gifFileName');
      //   await file.writeAsBytes(response.bodyBytes);
      // }
      for (int i = 0; i < gifs.length; i++) {
        String gifUrl = gifs[i];//bucketUrl +
        String gifFileName = gifs[i];
        String gifPath = '${appDocDir.path}/images/$gifFileName';
        print("Gif Path>>>>>> $gifPath");
        await dio.download(gifUrl, gifPath);
      }
      // Update flag in shared preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isDownloaded', true);
      // Display success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('GIFs downloaded successfully!')),
      );
    } catch (e) {
      print("Failed to download GIFs>>> $e");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to download GIFs.')),
      );
    } finally {
      setState(() {
        _isDownloading = false;
      });
    }
  }

  Future<void> _checkIfGifsDownloaded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isDownloaded = prefs.getBool('isDownloaded') ?? false;
    if (isDownloaded) {
      print('GIFs are already downloaded!');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('GIFs are already downloaded!')),
      );
    } else {
      // GIFs not downloaded yet, so download them
      await downloadGifs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is LoadingState) {
      } else if (state is ErrorState) {
      } else if (state is InternetErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          // backgroundColor: kColorPrimary,
          body: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // const SizedBox(
              //   height: 20,
              // ),
              Image.asset(
                'assets/images/splashwithopacity.png',
                height: MediaQuery.of(context).size.height,
                opacity: const AlwaysStoppedAnimation(0.8),
                // kColorBG.withOpacity(0.8),
                // color: kColorBG.withOpacity(0.2),
                // width: _animation.value * 300,
                //height: _animation.value * 300,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height*0.3, left: MediaQuery.of(context).size.width*0.1
                ),
                child: Image.asset(
                  'assets/icons/splashappname.png',
                  width: MediaQuery.of(context).size.width*0.7,
                  // height: 240.0,
                  // fit: BoxFit.cover,
                ),
                // Row(
                //   crossAxisAlignment: CrossAxisAlignment.end,
                //   children: [
                //     Container(
                //       height: 65,
                //       decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(20),
                //         border: Border.all(
                //           color: kColorPrimary,
                //           width: 3,
                //         )
                //       ),
                //     ),
                //     SizedBox(width: 10),
                //     Column(
                //       mainAxisAlignment: MainAxisAlignment.end,
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Daily Weight Loss',
                //           style: TextStyle(color: kColorPrimary, fontSize: 30,fontWeight: FontWeight.bold),
                //         ),
                //         Text(
                //           'Home Workout',
                //           style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
              ),
              // Align(
              //   alignment: Alignment.bottomCenter,
              //   child: Padding(
              //     padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
              //     child: ProgressBarAnimation(
              //       width: MediaQuery.of(context).size.width*0.8,
              //       height: 5,
              //       duration: const Duration(milliseconds: 800),
              //       gradient: const LinearGradient(
              //         colors: [
              //           kColorPrimary,
              //           kColorPrimary,
              //           // Color(0xff1e1e1e),
              //         ],
              //       ),
              //       backgroundColor: kColorFG,
              //     ),
              //   ),
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.05),
                  child: const Text(
                    'Powered by GameScapes',
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}