import 'dart:async';

import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';

class ExerciseRestScreen extends StatefulWidget {

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;
  ExerciseRestScreen({Key? key,required this.exerciseData,required this.dayModelLocalDB,}) : super(key: key);

  @override
  State<ExerciseRestScreen> createState() => _ExerciseRestScreenState();
}

class _ExerciseRestScreenState extends State<ExerciseRestScreen> {

  int index=0;

  late Timer _timer;
  double value = 10;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
        (Timer timer) {
          if (value == 0) {
            setState(() {
              timer.cancel();
              Navigator.of(context).pop();
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
    index=(widget.dayModelLocalDB!.exerciseNumInProgress);

    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
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
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height*0.028),
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
                      widget.exerciseData!.exerciseList![index].exercise.name,
                      style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height*0.03, fontWeight: FontWeight.bold,),
                    ),
                    Icon(Icons.question_mark_outlined, color: Colors.black, size: MediaQuery.of(context).size.height*0.03),
                  ],
                ),
                Text(
                  widget.exerciseData!.exerciseList![index].exercise.type =='rap'
                      ?
                  "${widget.exerciseData!.exerciseList![index].raps} raps"
                      :
                  "${widget.exerciseData!.exerciseList![index].time} sec",
                  style: TextStyle(fontSize: MediaQuery.of(context).size.height*0.025, color: kColorPrimary),
                ),
                SizedBox(height: MediaQuery.of(context).size.width*0.03),
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
                        value>=10 ? "00:${value.ceil()}" : "00:0${value.ceil()}",
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
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            _timer.cancel();
                            Navigator.of(context).pop();
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
    );
  }
}