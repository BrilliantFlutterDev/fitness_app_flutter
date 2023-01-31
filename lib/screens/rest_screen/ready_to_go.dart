import 'dart:async';

import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ReadyToGo extends StatefulWidget {

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  ReadyToGo({Key? key,required this.exerciseData,required this.dayModelLocalDB}) : super(key: key);

  @override
  State<ReadyToGo> createState() => _ReadyToGoState();
}

class _ReadyToGoState extends State<ReadyToGo> {

  // RequestExerciseData? exerciseData;

  late HomeBloc _homeBloc;
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
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    index=widget.dayModelLocalDB!.exerciseNumInProgress;

    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    // Navigator.of(context).push(MaterialPageRoute(
    //     builder: (ctx) =>  StartExercise(exerciseData: exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)));
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      }else if (state is UpdateAllExerciseState) {
        widget.exerciseData!.exerciseList![index]=state.exerciseModelLocalDB;
        double progress;
        if(index<widget.exerciseData!.exerciseList!.length) {
          if (widget.dayModelLocalDB!.completedPercentage == 0) {
            progress = (1 / widget.exerciseData!.exerciseList!.length);
            progress = progress * 100;
            print('>>>>>>> $progress');
          } else {
            progress = (widget.dayModelLocalDB!.completedPercentage / 100);
            progress = progress * widget.exerciseData!.exerciseList!.length;
            progress = progress + 1;
            progress = progress / widget.exerciseData!.exerciseList!.length;
            progress = progress * 100;
            print('>>>>>>>2 $progress');
          }

          index = index + 1;
          widget.dayModelLocalDB!.exerciseNumInProgress = index;


          _homeBloc.add(UpdateDayProgressEvent(
              dayModelLocalDB: widget.dayModelLocalDB!,
              progress: int.parse(progress.ceil().toString())));
        }

      }else if (state is UpdateDayProgressState) {
        widget.dayModelLocalDB=state.dayModelLocalDB;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
      inAsyncCall: state is LoadingState,
      child: Scaffold(
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
                            image: AssetImage("assets/images/Wheel Stretch.jpg"),
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
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 0),
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
                                'ARM CIRCLES',
                                // widget.exerciseData!.exerciseList![index].name,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Icon(Icons.question_mark_outlined),
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>  StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)));
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
      )
    );});
  }
}