import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
import 'package:fitness_app/screens/my_activity/replace_exercise_plan.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';

class EditPlan extends StatefulWidget {
  EditPlan({Key? key,this.dayModelLocalDB,required this.exerciseData}) : super(key: key);
  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {

  List<String> statusList = ['Replace', 'Delete'];
  late HomeBloc _homeBloc;


  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    //_homeBloc.add(GetAllExerciseOfDayEvent(day: widget.dayModelLocalDB!.name));
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
        widget.exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xff1c1b20),
            title: const Text("EDIT PLAN"),
          ),
          body: ColorRemover(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                // shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.exerciseData != null
                      ? widget.exerciseData!.exerciseList!.length
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
                                            "assets/images/${widget.exerciseData!.exerciseList![index].image}")),
                                  ),
                                  const SizedBox(
                                    width: 18.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.exerciseData!
                                            .exerciseList![index]
                                            .name,
                                        style: TextStyle(
                                          fontSize: MediaQuery.of(context).size.width*0.035,
                                          fontWeight:
                                          FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        widget.exerciseData!.exerciseList![index].type!='rap'?"${widget.exerciseData!.exerciseList![index].time} mins":
                                        "${widget.exerciseData!.exerciseList![index].raps} Raps",
                                        style: const TextStyle(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                  width: 50,
                                  height: 20,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: DropdownButton(
                                        isExpanded: true,
                                        underline: const SizedBox(),
                                        dropdownColor: Colors.white,
                                        icon: const Icon(
                                          Icons.menu,
                                          color: kColorPrimary,
                                          size: 22,
                                        ),
                                        iconSize: 20,
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.black,
                                        ),
                                        onChanged: (valueItem) {
                                          if(valueItem=='Delete'){
                                            _homeBloc.add(DeleteExerciseInADayEvent(exerciseData: widget.exerciseData!, index: index));
                                          }
                                          else if(valueItem=='Replace'){
                                            Navigator.of(context).push(MaterialPageRoute(
                                                builder: (ctx) =>  ReplaceExercisePlan( dayModelLocalDB: widget.dayModelLocalDB,index: index, exerciseData: widget.exerciseData,)));
                                          }
                                        },
                                        items: statusList.map((valueItem) {
                                          return DropdownMenuItem(
                                            child: Text(valueItem),
                                            value: valueItem,
                                            onTap: () {
                                              _homeBloc.add(RefreshScreenEvent());
                                            },
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  )),
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
        ),
      );});
  }
}