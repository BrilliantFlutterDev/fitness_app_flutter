import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/my_activity/edit_plan.dart';
import 'package:fitness_app/screens/select_exercise/select_exercise.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/modal_progress_hud.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class OpenActivity extends StatefulWidget {
  const OpenActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<OpenActivity> createState() => _OpenActivityState();
}

class _OpenActivityState extends State<OpenActivity> {
  late HomeBloc _homeBloc;
  RequestExerciseData? exerciseData;

  final List<bool> _selectedPlan = <bool>[true, false, false];

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
      } else if (state is RefreshScreenState) {
      } else if (state is GetAllExerciseState) {
        exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        color: kColorPrimary,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 20.0,
                        ),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.control_point_duplicate_outlined,
                        color: Color(0xff1ce5c1),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                    ],
                  ),
                  // const SizedBox(
                  //   height: .0,
                  // ),
                  const Text(
                    "90 hours | Amenda Johnson",
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Strecho Workout.jpg'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            floatingActionButton: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.1),
                  child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) {
                          return StatefulBuilder(builder: (BuildContext context,
                              StateSetter setState /*You can rename this!*/) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 18, left: 18, right: 18),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: Wrap(
                                  children: [
                                    ListTile(
                                      title: Text(
                                        "Workout Settings",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        "Choose workout based on your condition",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.white),
                                      ),
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.38,
                                      width: MediaQuery.of(context).size.width,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedPlan[2] = false;
                                                  _selectedPlan[1] = false;
                                                  _selectedPlan[0] = true;
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(12),
                                                child: Container(
                                                  height: 9.h,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'I\'M FINE',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0,
                                                            color: _selectedPlan[
                                                                        0] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        'All workout are OK for me',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: _selectedPlan[
                                                                        0] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.0),
                                                    // image: DecorationImage(
                                                    //   image: AssetImage(
                                                    //       "assets/images/${constants.standard[index].image}"),
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                    gradient: LinearGradient(
                                                      // begin: Alignment.bottomCenter,
                                                      // end: Alignment.topCenter,
                                                      colors: [
                                                        _selectedPlan[0] ==
                                                                false
                                                            ? const Color(
                                                                0xff1c1b20)
                                                            : Colors.white60,
                                                        _selectedPlan[0] ==
                                                                false
                                                            ? Colors.transparent
                                                            : Colors.white,
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedPlan[0] = false;
                                                  _selectedPlan[2] = false;
                                                  _selectedPlan[1] = true;
                                                });
                                              },
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: Container(
                                                  height: 9.h,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'NO JUMPING',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0,
                                                            color: _selectedPlan[
                                                                        1] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        'No noise, apartment friendly',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: _selectedPlan[
                                                                        1] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.0),
                                                    // image: DecorationImage(
                                                    //   image: AssetImage(
                                                    //       "assets/images/${constants.standard[index].image}"),
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                    gradient: LinearGradient(
                                                      // begin: Alignment.b,
                                                      // end: Alignment.topCenter,
                                                      colors: [
                                                        _selectedPlan[1] ==
                                                                false
                                                            ? const Color(
                                                                0xff1c1b20)
                                                            : Colors.white60,
                                                        _selectedPlan[1] ==
                                                                false
                                                            ? Colors.transparent
                                                            : Colors.white,
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 5),
                                            GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  _selectedPlan[0] = false;
                                                  _selectedPlan[1] = false;
                                                  _selectedPlan[2] = true;
                                                });
                                              },
                                              child: Container(
                                                margin:
                                                    const EdgeInsets.all(12),
                                                child: Container(
                                                  height: 9.h,
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 20.0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'LOW IMPACT',
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20.0,
                                                            color: _selectedPlan[
                                                                        2] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                      Text(
                                                        'Friendly to overweight people',
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            color: _selectedPlan[
                                                                        2] ==
                                                                    false
                                                                ? Colors.white
                                                                : Colors.black),
                                                      ),
                                                    ],
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            35.0),
                                                    // image: DecorationImage(
                                                    //   image: AssetImage(
                                                    //       "assets/images/${constants.standard[index].image}"),
                                                    //   fit: BoxFit.cover,
                                                    // ),
                                                    gradient: LinearGradient(
                                                      // begin: Alignment.bottomCenter,
                                                      // end: Alignment.topCenter,
                                                      colors: [
                                                        _selectedPlan[2] ==
                                                                false
                                                            ? const Color(
                                                                0xff1c1b20)
                                                            : Colors.white60,
                                                        _selectedPlan[2] ==
                                                                false
                                                            ? Colors.transparent
                                                            : Colors.white,
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Container(
                                          height: 1, color: Colors.white),
                                    ),
                                    ListTile(
                                      leading: Icon(Icons.restaurant),
                                      title: Text('Training rest'),
                                      trailing: Text("10 sec",
                                          style: TextStyle(color: Colors.blue)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      const StartExercise()));
                                        },
                                        child: Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.08,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.85,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.blue,
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Done",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              //Icons.play_arrow,
                                              //color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.15,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                //SizedBox(width: MediaQuery.of(context).size.width*0.08),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const StartExercise()));
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.075,
                    width: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: const Color(0xff1ce5c1),
                    ),
                    child: Center(
                      child: Text(
                        "GO!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                        //Icons.play_arrow,
                        //color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(12.0),
                  right: Radius.circular(12.0),
                ),
                color: Color(0xff1c1b20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(12.0),
                    //     color: const Color(0xff38373a),
                    //   ),
                    //   child: const TabBar(
                    //     tabs: [
                    //       Tab(
                    //         text: ("Workouts"),
                    //       ),
                    //       Tab(
                    //         text: ("Trainer"),
                    //       ),
                    //     ],
                    //     indicatorColor: Colors.transparent,
                    //     labelColor: Color(0xff1ce5c1),
                    //     unselectedLabelColor: Colors.grey,
                    //     labelStyle: TextStyle(
                    //       fontSize: 18,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //     unselectedLabelStyle: TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 18,
                    //     ),
                    //   ),
                    //   height: 60,
                    //   width: 240,
                    // ),
                    Text(
                      "Instruction",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Beginner",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "Level",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "59.7",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "Kcal",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "4 mins",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              Text(
                                "Duration",
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          "Exercises  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Text(
                          "(7)",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.45),
                        Text(
                          "Edit  ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EditPlan()));
                            },
                            child: Icon(
                              Icons.edit_outlined,
                              color: Colors.grey,
                            )),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Expanded(
                      child: //ColorRemover(
                          //child: TabBarView(children: [
                          ColorRemover(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: exerciseData != null
                                ? exerciseData!.exerciseList!.length
                                : 0,
                            itemBuilder: (ctx, index) {
                              return exerciseData!
                                          .exerciseList![index].dayTitle ==
                                      widget.title
                                  ? GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (ctx) =>
                                                    const SelectExercise()));
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
                                                        "assets/images/${exerciseData!.exerciseList![index].image}")),
                                              ),
                                              const SizedBox(
                                                width: 18.0,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    exerciseData!
                                                        .exerciseList![index]
                                                        .name,
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
                                                    "${exerciseData!.exerciseList![index].time} mins | ${exerciseData!.exerciseList![index].raps} Raps",
                                                    style: const TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    )
                                  : const SizedBox();
                            }),
                      ),
                      // ColorRemover(
                      //   child: ListView.builder(
                      //       physics: const BouncingScrollPhysics(),
                      //       itemCount: constants.chat.length,
                      //       itemBuilder: (ctx, index) {
                      //         return GestureDetector(
                      //           onTap: () {
                      //             Navigator.of(context).push(MaterialPageRoute(
                      //                 builder: (ctx) =>
                      //                     const SelectExercise()));
                      //           },
                      //           child: Padding(
                      //             padding: const EdgeInsets.all(18.0),
                      //             child: Row(
                      //               children: [
                      //                 ClipRRect(
                      //                   borderRadius:
                      //                       BorderRadius.circular(8.0),
                      //                   child: Image(
                      //                       height: 80,
                      //                       width: 90,
                      //                       fit: BoxFit.cover,
                      //                       image: AssetImage(
                      //                           "assets/images/${constants.chat[index].image}")),
                      //                 ),
                      //                 const SizedBox(
                      //                   width: 18.0,
                      //                 ),
                      //                 Column(
                      //                   crossAxisAlignment:
                      //                       CrossAxisAlignment.start,
                      //                   children: [
                      //                     Text(
                      //                       constants.chat[index].name,
                      //                       style: const TextStyle(
                      //                         fontSize: 20,
                      //                         fontWeight: FontWeight.bold,
                      //                       ),
                      //                     ),
                      //                     const SizedBox(
                      //                       height: 6.0,
                      //                     ),
                      //                     const Text(
                      //                       "Trainer",
                      //                       style: TextStyle(
                      //                         fontSize: 12,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // ),
                      // ]),
                      //),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
