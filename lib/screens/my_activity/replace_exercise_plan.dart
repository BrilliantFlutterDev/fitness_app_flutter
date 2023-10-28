import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
// import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:sizer/sizer.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';
import '../replace_exercise/replace_exercise.dart';

class ReplaceExercisePlan extends StatefulWidget {

  DayModelLocalDB? dayModelLocalDB;
  int index;
  RequestExerciseData? exerciseData;

  ReplaceExercisePlan({Key? key,required this.dayModelLocalDB,required this.index,required this.exerciseData}) : super(key: key);

  @override
  State<ReplaceExercisePlan> createState() => _ReplaceExercisePlanState();
}

class _ReplaceExercisePlanState extends State<ReplaceExercisePlan> {

  late HomeBloc _homeBloc;
  // RequestExerciseData? exerciseData;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    // _homeBloc.add(GetAllExerciseEvent());
  }

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
    var screenSize = MediaQuery.of(context).size;

    // exerciseData!.exerciseList!.sort((a, b){
    //   return a.exercise.name.compareTo(b.exercise.name);
    // });
    constants.AllExercises.sort((a, b){
      return a.name.compareTo(b.name);
    });

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
      }else if (state is RefreshScreenState) {
      } else if (state is GetAllExerciseState) {
        widget.exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          backgroundColor: kColorBG,
          appBar: AppBar(
            backgroundColor: kColorBG,
            title: const Text("Replace Exercise"),
          ),
          body: ColorRemover(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Current",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: kColorPrimary)
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                  GestureDetector(
                    onTap: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //         builder: (ctx) =>
                      //             SelectExercise(exerciseModelLocalDB: exerciseData!
                      //                 .exerciseList![index],)));

                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                              BorderRadius.circular(8.0),
                              child: Image(
                                  height: 70,
                                  width: 80,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/${widget.exerciseData!.exerciseList![widget.index].exercise.image}")),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.05),
                            Text(
                              widget.exerciseData!.exerciseList![widget.index].exercise.name,
                              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                  const Text(
                    "Replace with",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: kColorPrimary)
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.028),
                  Container(
                    height: screenSize.height*0.6,
                    child: ListView.builder(
                      shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: constants.AllExercises.length,
                        // exerciseData != null
                        //     ? exerciseData!.exerciseList!.length
                        //     : 0,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (ctx) =>
                                          ReplaceExercise(exerciseModelLocalDB: widget.exerciseData!.exerciseList![index], exerciseDetailModel: constants.AllExercises[index] as ExerciseDetailModel, exerciseData: widget.exerciseData,
                                            dayModelLocalDB: widget.dayModelLocalDB, current_index: index+1,
                                          )
                                  )
                              );
                            },
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(8.0),
                                          child: Image(
                                              height: 70,
                                              width: 80,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                "assets/images/${constants.AllExercises[index].image}")),
                                                // "assets/images/${exerciseData!.exerciseList![index].exercise.image}")),
                                        ),
                                        SizedBox(width: MediaQuery.of(context).size.width*0.05),
                                        Container(
                                          width: MediaQuery.of(context).size.width*0.6,
                                          child: Text(
                                            constants.AllExercises[index].name,
                                            // exerciseData!.exerciseList![index].exercise.name,
                                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                            softWrap: true,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}