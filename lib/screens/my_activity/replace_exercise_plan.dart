import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';

class ReplaceExercisePlan extends StatefulWidget {
  ReplaceExercisePlan({Key? key,required this.dayModelLocalDB,required this.index,required this.exerciseData}) : super(key: key);
  DayModelLocalDB? dayModelLocalDB;
  int index;
  RequestExerciseData? exerciseData;


  @override
  State<ReplaceExercisePlan> createState() => _ReplaceExercisePlanState();
}

class _ReplaceExercisePlanState extends State<ReplaceExercisePlan> {

  List<String> statusList = ['Replace', 'Delete'];
  late HomeBloc _homeBloc;
  RequestExerciseData? exerciseData;


  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.add(GetAllExerciseEvent());
  }

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
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
      }else if (state is RefreshScreenState) {
      } else if (state is GetAllExerciseState) {
        exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1c1b20),
            title: const Text("Replace Exercise"),
          ),
          body: ColorRemover(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(" Current",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GestureDetector(
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
                                  height: 80,
                                  width: 90,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/${exerciseData!.exerciseList![widget.index].exercise.image}")),
                            ),
                            const SizedBox(
                              width: 18.0,
                            ),
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                Text(
                                  exerciseData!.exerciseList![widget.index].exercise.name,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight:
                                    FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  exerciseData!.exerciseList![widget.index].exercise.type!='rap'?"${exerciseData!.exerciseList![widget.index].time} mins":
                                  "${exerciseData!.exerciseList![widget.index].raps} Raps",
                                  style: const TextStyle(
                                    fontSize: 12,
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
                  ),
                ),
                const SizedBox(height: 10,),
                const Text(" Replace with",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                const SizedBox(height: 15,),
                Container(
                  height: screenSize.height*0.62,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: exerciseData != null
                            ? exerciseData!.exerciseList!.length
                            : 0,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(8.0),
                                          child: Image(
                                              height: 80,
                                              width: 90,
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  "assets/images/${exerciseData!.exerciseList![index].exercise.image}")),
                                        ),
                                        const SizedBox(
                                          width: 18.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              exerciseData!.exerciseList![index].exercise.name,
                                              style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight:
                                                FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 6.0,
                                            ),
                                            Text(
                                              exerciseData!.exerciseList![index].exercise.type!='rap'?"${exerciseData!.exerciseList![index].time} mins":
                                              "${exerciseData!.exerciseList![index].raps} Raps",
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    InkWell(
                                      onTap: (){},
                                      child: SizedBox(
                                          width: 60,
                                          height: 60,
                                          child: Icon(Icons.reply_all_sharp,color: kColorPrimary,)
                                      ),
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
                ),
              ],
            ),
          ),
        ),
      );});
  }
}