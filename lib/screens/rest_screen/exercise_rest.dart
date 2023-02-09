import 'dart:async';

import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/Utils/modal_progress_hud.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/open_activity.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class ExerciseRestScreen extends StatefulWidget {

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  ExerciseRestScreen({Key? key,required this.exerciseData,required this.dayModelLocalDB,}) : super(key: key);

  @override
  State<ExerciseRestScreen> createState() => _ExerciseRestScreenState();
}

class _ExerciseRestScreenState extends State<ExerciseRestScreen> {

  late HomeBloc _homeBloc;
  int index=0;

  late Timer _timer;
  double value = 10;

  int pushUp = 10;
  int plank = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (value == 0) {
          setState(() {
            timer.cancel();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                 builder: (ctx) =>
                    StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB)
                )
            );
          });
        } else {
          setState(() {
            value--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    index=(widget.dayModelLocalDB!.exerciseNumInProgress);

    startTimer();

    pushUp = int.parse(AppGlobal.selectedPushUpOption!);
    print(AppGlobal.selectedPushUpOption);

    plank = int.parse(AppGlobal.selectedPlankOption!);
    print(AppGlobal.selectedPlankOption);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
            bottomNavigationBar: Container(
              height: MediaQuery.of(context).size.height*0.18,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width*0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Next exercise ",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        // Text(
                        //   widget.exerciseData!=null? "${widget.current_index}/${widget.exerciseData!.exerciseList!.length}" :"0/0",
                        //   style: TextStyle(fontSize: 20),
                        //   // ${widget.exerciseModelLocalDB.columnsId}
                        // ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          widget.exerciseData!.exerciseList![index].name,
                          style: const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold,),
                        ),
                        // Icon(Icons.question_mark_outlined, color: Colors.black, size: 17),
                      ],
                    ),
                    Text(
                      widget.exerciseData!.exerciseList![index].type =='rap'
                          ?
                      widget.exerciseData!.exerciseList![index].name=='PUSH-UPS'
                          ?
                      "$pushUp raps" : "${widget.exerciseData!.exerciseList![index].raps} raps"
                          :
                      widget.exerciseData!.exerciseList![index].name=='PLANK'
                          ?
                      "$plank secs" : "${widget.exerciseData!.exerciseList![index].time} sec",
                      style: const TextStyle(fontSize: 16, color: kColorPrimary),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.width*0.05),
                  ],
                ),
              ),
            ),
          body: SafeArea(
            child: ColorRemover(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "REST",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04, bottom: MediaQuery.of(context).size.height*0.03),
                    child: Text(
                      "00:${value.ceil()}",
                      style: const TextStyle(fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: MediaQuery.of(context).size.width*0.05),
                      InkWell(
                        onTap: () {
                          value = value+20;
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: kColorFG,
                          ),
                          child: const Center(
                            child: Text(
                              "+20s",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
                              //Icons.play_arrow,
                              //color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (ctx) =>
                                  StartExercise(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB,)
                              )
                            );
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          width: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              "Skip",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width*0.05),
                    ],
                  ),
                ],
              )
            )
          )
        )
      );
    });
  }
}