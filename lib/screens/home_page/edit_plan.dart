import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/Helper/db_helper.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
import 'package:fitness_app/screens/my_activity/replace_exercise_plan.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:flutter/material.dart' hide ReorderableList;
import 'package:flutter_reorderable_list/flutter_reorderable_list.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';

import '../../widgets/delete_exercise_popup.dart';

class EditPlan extends StatefulWidget {

  EditPlan({Key? key,this.dayModelLocalDB, required this.exerciseData}) : super(key: key);

  // ExerciseModelLocalDB exerciseModelLocalDB;
  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;

  @override
  State<EditPlan> createState() => _EditPlanState();
}

class _EditPlanState extends State<EditPlan> {

  List<String> statusList = ['Replace', 'Delete'];
  late HomeBloc _homeBloc;
  int draggedIndex = 0;
  int targetIndex = 0;
  bool visible = false;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    analytics.setCurrentScreen(screenName: "Edit Exercise Screen");
    //_homeBloc.add(GetAllExerciseOfDayEvent(day: widget.dayModelLocalDB!.name));
  }

  void _onReorder(int oldIndex, int newIndex) async {
    if (newIndex > widget.exerciseData!.exerciseList!.length) newIndex = widget.exerciseData!.exerciseList!.length;
    if (oldIndex < newIndex) newIndex -= 1;

    setState(() {
      visible = true;
      final ExerciseModelLocalDB item = widget.exerciseData!.exerciseList![oldIndex];
      widget.exerciseData!.exerciseList!.removeAt(oldIndex);

      // print(item.title);
      widget.exerciseData!.exerciseList!.insert(newIndex, item);

      draggedIndex = oldIndex;
      targetIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
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
      } else if (state is UpdateAllExerciseState) {
        // widget.exerciseModelLocalDB=state.exerciseModelLocalDB;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          backgroundColor: kColorBG,
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            width: AdmobHelper.getBannerAd().size.width.toDouble(),//double.infinity,
            child: AdWidget(
              ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
              key: UniqueKey(),
            ),
          ),
          appBar: AppBar(
            backgroundColor: kColorBG,
            title: const Text("EDIT PLAN"),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: InkWell(
                  onTap: (){
                    _homeBloc.add(SwapAExerciseOfDayEvent(
                      oldIndex: widget.exerciseData!.exerciseList![draggedIndex].columnsId!.toInt(),
                      newIndex: widget.exerciseData!.exerciseList![targetIndex].columnsId!.toInt()
                    ));
                    visible = false;
                    print("List1>>>>>: ${widget.exerciseData!.exerciseList![draggedIndex].exercise.name}");
                    print("List2>>>>>: ${widget.exerciseData!.exerciseList![targetIndex].exercise.name}");
                  },
                  child: Visibility(
                    visible: visible,
                    child: const Text(
                        "Done",
                        style: TextStyle(fontSize: 15),
                    ),
                  )
                ),
              ),
            ],
          ),
          body: ColorRemover(
            child: ReorderableListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                for (int index = 0; index < widget.exerciseData!.exerciseList!.length; index += 1)
                  Column(
                    key: Key('$index'),
                    children: [
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.menu,
                                color: Colors.grey,
                                size: 22,
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.05),
                              ClipRRect(
                                borderRadius:
                                BorderRadius.circular(8.0),
                                child: Image(
                                  height: 75,
                                  width: 85,
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/images/${widget.exerciseData!.exerciseList![index].exercise.image}")),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width*0.05),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.exerciseData!.exerciseList![index].exercise.name,
                                    style: TextStyle(
                                      fontSize: MediaQuery.of(context).size.width*0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    widget.exerciseData!.exerciseList![index].exercise.type!='rap'?"${widget.exerciseData!.exerciseList![index].time} mins":
                                    "${widget.exerciseData!.exerciseList![index].raps} Raps",
                                    style: const TextStyle(fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.2,
                              height: MediaQuery.of(context).size.height*0.04,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 5),
                                  child: DropdownButton(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    dropdownColor: Colors.white,
                                    icon: const Icon(
                                      Icons.more_vert,
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
                                        showDialog(
                                            context: context,
                                            builder: (_) => Dialog(
                                              child: SizedBox(
                                                height: MediaQuery.of(context).size.height * 0.15,
                                                child: DeleteExercisePopup(exerciseData: widget.exerciseData!, index: index),
                                              ),
                                            ));
                                        // _homeBloc.add(DeleteExerciseInADayEvent(exerciseData: widget.exerciseData!, index: index));
                                      }
                                      else if(valueItem=='Replace'){
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (ctx) =>  ReplaceExercisePlan(dayModelLocalDB: widget.dayModelLocalDB, index: index, exerciseData: widget.exerciseData,)
                                        ));
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
                              )
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  )
              ],
              onReorder: _onReorder,
              // onReorder: (int oldIndex, int newIndex) {
              //   setState(() {
              //     visible = true;
              //     print("mOldIndex: $oldIndex, mNewIndex: $newIndex");
              //     if (oldIndex < newIndex) {
              //       newIndex -= 1;
              //       // widget.exerciseData!.exerciseList![oldIndex].index = newIndex;
              //     }
              //     // else {
              //     //   widget.exerciseData!.exerciseList![oldIndex].index = newIndex;
              //     // }
              //
              //     final ExerciseModelLocalDB item = widget.exerciseData!.exerciseList!.removeAt(oldIndex);
              //     widget.exerciseData!.exerciseList!.insert(newIndex, item);
              //
              //     draggedIndex = oldIndex;
              //     targetIndex = newIndex;
              //
              //     // for (int i = 0; i < widget.exerciseData!.exerciseList!.length; i++) {
              //     //   widget.exerciseData!.exerciseList![i].index = i;
              //     // }
              //
              //     // print("Old Index: ${widget.exerciseData!.exerciseList![oldIndex].columnsId!.toInt()}     New Index: ${widget.exerciseData!.exerciseList![newIndex].columnsId!.toInt()}");
              //     print("Old Index: $oldIndex, New Index: $newIndex");
              //     // _homeBloc.add(SwapAExerciseOfDayEvent(
              //     //     // oldIndex: widget.exerciseData!.exerciseList![oldIndex].columnsId!.toInt(),
              //     //     // newIndex: widget.exerciseData!.exerciseList![newIndex].columnsId!.toInt()
              //     //     oldIndex: draggedIndex,
              //     //     newIndex: targetIndex
              //     // ));
              //   });
              // },
            ),
          ),
        ),
      );
    });
  }
}