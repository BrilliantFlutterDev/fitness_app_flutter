import 'dart:async';

import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

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

  int index=0;

  late Timer _timer;
  double _start = 10;

  startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) =>  StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)));
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
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

    startTimer();
  }

  @override
  void dispose() {
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
                          Text(
                            "READY TO GO!",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kColorPrimary),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.05),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                widget.exerciseData!.exerciseList![index].exercise.name,
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,),
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
                                initialValue: _start,
                                min: 0,
                                max: 10,
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
                                      "${_start.ceil()}",
                                      style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.1),
                                    ),
                                  );
                                },
                                onChange: (e) {
                                  setState(() {
                                    _start = e;
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
                                  child: Icon(Icons.arrow_forward_ios)),
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