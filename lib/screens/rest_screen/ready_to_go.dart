import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
// import 'package:video_player/video_player.dart';

class ReadyToGo extends StatefulWidget {

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  // int current_index;
  ReadyToGo({Key? key,required this.exerciseData, required this.dayModelLocalDB,}) : super(key: key);

  @override
  State<ReadyToGo> createState() => _ReadyToGoState();
}

class _ReadyToGoState extends State<ReadyToGo> {

  // RequestExerciseData? exerciseData;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  int index=0;

  late Timer _timer;
  double start = 10;
  double value = 10;
  // late VideoPlayerController _controller;

  startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (start == 0) {
          setState(() {
            timer.cancel();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>  StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)
            ));
          });
        } else {
          setState(() {
            start--;
          });
        }
      },
    );
  }

  void saveCountDown() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    start = pref.getDouble('countdown')!;
    setState(() {
      value = start;
    });
  }

  @override
  void initState() {
    super.initState();
    if(widget.dayModelLocalDB!.exerciseNumInProgress < (widget.exerciseData!.exerciseList!.length-1)){
      index=widget.dayModelLocalDB!.exerciseNumInProgress;
    }
    // else{
    //   widget.dayModelLocalDB!.exerciseNumInProgress=0;
    //   index=widget.dayModelLocalDB!.exerciseNumInProgress;
    // }

    // _controller = VideoPlayerController.asset('assets/images/${widget.exerciseData!.exerciseList![index].exercise.video}');
    //
    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize().then((_) => setState(() {}));
    // _controller.play();

    saveCountDown();
    startTimer();
    analytics.setCurrentScreen(screenName: "Ready To Go Screen");
  }

  @override
  void dispose() {
    // _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBG,
      body: SafeArea(
        child: ColorRemover(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // Container(
                      //   height: MediaQuery.of(context).size.height * 0.40,
                      //   child: AspectRatio(
                      //     aspectRatio: _controller.value.aspectRatio,
                      //     child: VideoPlayer(_controller),
                      //   ),
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.40,
                        decoration:  BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/${widget.exerciseData!.exerciseList![index].exercise.image}"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kColorBG,
                              Colors.transparent,
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          child: Column(
                            children: [
                              AppBar(
                                leading: IconButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.arrow_back_sharp)),
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height*0.06),
                          const Text(
                            "READY TO GO!",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kColorPrimary),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.exerciseData!.exerciseList![index].exercise.name,
                                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
                              ),
                              // Icon(Icons.question_mark_outlined),
                            ],
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: MediaQuery.of(context).size.width*0.1),
                              SleekCircularSlider(
                                initialValue: start,
                                min: 0,
                                max: value,
                                appearance: CircularSliderAppearance(
                                  startAngle: 270,
                                  angleRange: 360,
                                  size: MediaQuery.of(context).size.width * 0.35,
                                  customWidths: CustomSliderWidths(
                                      progressBarWidth: 6.0, trackWidth: 6.0
                                  ),
                                  customColors: CustomSliderColors(

                                    hideShadow: true,
                                    progressBarColor: kColorPrimary,
                                    dotColor: Colors.transparent,
                                    trackColor: Colors.white,
                                    progressBarColors: [
                                      kColorPrimary,
                                      kColorPrimary,
                                    ],
                                  ),
                                ),
                                innerWidget: (re) {
                                  return Center(
                                    child: Text(
                                      "${start.ceil()}",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.1),
                                    ),
                                  );
                                },
                                onChange: (e) {
                                  setState(() {
                                    start = e;
                                  });
                                },
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.1),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)
                                        )
                                    );
                                    _timer.cancel();
                                  },
                                  child: const Icon(Icons.arrow_forward_ios)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),
    );
  }
}