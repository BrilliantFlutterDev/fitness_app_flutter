import 'dart:async';

import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/screens/home_page/open_activity.dart';
import 'package:fitness_app/screens/home_page/quit_screens/quit_screen.dart';
import 'package:fitness_app/screens/rest_screen/exercise_rest.dart';
import 'package:fitness_app/screens/rest_screen/rest_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';
import '../../constants/colors.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class StartExercise extends StatefulWidget {
  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  StartExercise({Key? key,required this.exerciseData,required this.dayModelLocalDB,}) : super(key: key);

  @override
  State<StartExercise> createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  late Timer _timer;
  late double value;
  int index=0;
  late HomeBloc _homeBloc;

  int pushUp = 10;
  double plank = 15;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (value == 0) {
          setState(() {
            timer.cancel();
            if(index<(widget.exerciseData!.exerciseList!.length-1)) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                      builder: (ctx) =>
                          ExerciseRestScreen(exerciseData: widget.exerciseData, dayModelLocalDB: widget.dayModelLocalDB)
                  )
              );

              _homeBloc.add(ChangeExerciseStatusToDoneEvent(
                    exerciseModelLocalDB: widget.exerciseData!.exerciseList![index]));
              }
            else if(index>(widget.exerciseData!.exerciseList!.length-1)) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (ctx) => OpenActivity()
                    )
                  );
              }
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
    index=widget.dayModelLocalDB!.exerciseNumInProgress;
    if(widget.exerciseData!.exerciseList![index].type=='time'){
      startTimer();
    }

    pushUp = int.parse(AppGlobal.selectedPushUpOption!);
    print(AppGlobal.selectedPushUpOption);

    plank = double.parse(AppGlobal.selectedPlankOption!);
    print(AppGlobal.selectedPlankOption);

    if(widget.exerciseData!.exerciseList![index].name=='PLANK') {
      value = plank;
      value = double.parse(plank.toString());
    } else {
      value = double.parse(widget.exerciseData!.exerciseList![index].time.toString());
    }

  }

  @override
  void dispose() {
    _timer.cancel();
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
            progress = (progress * 100);
            print('>>>>>>> $progress');
          } else {
            progress = (widget.dayModelLocalDB!.completedPercentage / 100);
            progress = progress * widget.exerciseData!.exerciseList!.length;
            progress = progress + 1;
            progress = progress / widget.exerciseData!.exerciseList!.length;
            progress = (progress * 100).floorToDouble();
            print('>>>>>>>2 $progress');
          }
          // progress = progress+1;
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
                            image: AssetImage("assets/images/${widget.exerciseData!.exerciseList![index].image}"),
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
                              Color(0xff1c1b20),
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
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                              const QuitScreen())
                                      );
                                      // Navigator.of(context).pop();
                                    },
                                    icon: const Icon(Icons.arrow_back_sharp)),
                                backgroundColor: Colors.transparent,
                                // actions: [
                                //   IconButton(
                                //       onPressed: () {},
                                //       icon: const Icon(Icons.info_outline)),
                                // ],
                              ),
                              // const Spacer(),
                              //  Text(
                              //   widget.exerciseData!.exerciseList![index].name,
                              //   style: TextStyle(
                              //     fontSize: 24,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                              // const SizedBox(
                              //   height: 6.0,
                              // ),
                              // const Text(
                              //   "2 mins |1 set |15 reps",
                              //   style:
                              //       TextStyle(fontSize: 14, color: Colors.grey),
                              // ),
                              // const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.exerciseData!.exerciseList![index].name,
                              // "READY TO GO!",
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: MediaQuery.of(context).size.height*0.015),

                          Text(
                            widget.exerciseData!.exerciseList![index].type =='rap'
                                ?
                            widget.exerciseData!.exerciseList![index].name=='PUSH-UPS'
                                ?
                            "X $pushUp raps" : "X ${widget.exerciseData!.exerciseList![index].raps} raps"
                                :
                            widget.exerciseData!.exerciseList![index].name=='PLANK'
                                ?
                            "00:${value.ceil()} sec" : "00:${value.ceil()} sec",
                            style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,),
                          ),
                          // "$plank secs"
                          // "${widget.exerciseData!.exerciseList![index].time} sec"

                          // widget.exerciseData!.exerciseList![index].time
                          // widget.exerciseData!.exerciseList![index].type=='rap'
                          //     ?
                          // widget.exerciseData!.exerciseList![index].name=='PUSH-UPS'
                          //     ?
                          // Text(
                          //   "X ${widget.exerciseData!.exerciseList![index].raps}",
                          //   style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,
                          //   ),
                          // ):
                          // widget.exerciseData!.exerciseList![index].type=='time'?
                          // Text(
                          //   "00:${value.ceil()} sec",
                          //   style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold,
                          //   ),
                          // ):const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.01),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.3,
                      alignment: Alignment.center,
                      child: MyButton(name: widget.exerciseData!.exerciseList![index].type=='rap'?"Done":"Done", whenpress: () {
                        if(index<(widget.exerciseData!.exerciseList!.length)) {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) =>
                                      ExerciseRestScreen(dayModelLocalDB: widget.dayModelLocalDB, exerciseData: widget.exerciseData,)
                              )
                          );

                          _homeBloc.add(ChangeExerciseStatusToDoneEvent(
                              exerciseModelLocalDB: widget.exerciseData!.exerciseList![index]));

                        }
                        // else if(index==(widget.exerciseData!.exerciseList!.length)-1) {
                        //   Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(
                        //       builder: (ctx) => OpenActivity()
                        //     )
                        //   );
                        //   // Navigator.pop(context);
                        // }
                        else {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (ctx) => OpenActivity()
                              )
                          );
                        }
                      }),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.025
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1, right: MediaQuery.of(context).size.width*0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        widget.exerciseData!.exerciseList![index].type=='rap'?SizedBox(
                          height: screenSize.height*0.07,
                        ):const SizedBox(),
                        index!=0?GestureDetector(
                          onTap: () {
                            if(index>=1){
                              index=index-1;
                              setState(() {
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Icon(Icons.skip_previous, color: kColorPrimary,),
                              Text(
                                "PREVIOUS",
                                style: TextStyle(fontSize: 18, color: kColorPrimary, fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                        ):SizedBox(),
                        SizedBox(width: MediaQuery.of(context).size.width*0.28),
                        index<widget.exerciseData!.exerciseList!.length-1?GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) =>
                                        ExerciseRestScreen(dayModelLocalDB: widget.dayModelLocalDB, exerciseData: widget.exerciseData,)
                                )
                            );
                            if(index<widget.exerciseData!.exerciseList!.length){
                              setState(() {
                                index=index+1;
                              });
                            }
                          },
                          child: Row(
                            children: [
                              Icon(Icons.skip_next, color: kColorPrimary),
                              Text(
                                "SKIP",
                                style: TextStyle(fontSize: 18, color: kColorPrimary, fontWeight: FontWeight.bold,),
                              ),
                            ],
                          ),
                        ):const SizedBox(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.03,
                  ),
                  // const SizedBox(
                  //   height: 24.0,
                  // ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              index<widget.exerciseData!.exerciseList!.length-1? "Up Next: " : "",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kColorPrimary),
                            ),
                            Text(
                              index<widget.exerciseData!.exerciseList!.length-1? widget.exerciseData!.exerciseList![index+1].name:"",
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        // index<widget.exerciseData!.exerciseList!.length-1?const Text(
                        //   "5 mins |2 set |26 reps",
                        //   style: TextStyle(fontSize: 14, color: Colors.grey),
                        // ):const SizedBox(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );});
  }
}
