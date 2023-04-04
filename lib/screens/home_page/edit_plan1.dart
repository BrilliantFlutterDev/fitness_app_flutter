import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Helper/DBModels/exercise_model.dart';
import '../../Utils/modal_progress_hud.dart';
import '../../constants/colors.dart';
import '../../constants/constants.dart';
import '../../widgets/color_remover.dart';
import '../../widgets/delete_exercise_popup.dart';
import '../my_activity/replace_exercise_plan.dart';
import 'HomePageBloc/home_bloc.dart';

class ListExample extends StatefulWidget {

  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;
  ListExample({Key? key, this.dayModelLocalDB, required this.exerciseData}) : super(key: key);

  @override
  State<ListExample> createState() => _ListExampleState();
}

class _ListExampleState extends State<ListExample> {

  List<String> statusList = ['Replace', 'Delete'];
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
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
            appBar: AppBar(
              backgroundColor: kColorBG,
              title: const Text("EDIT PLAN"),
            ),
            body: ColorRemover(
              child: ReorderableListView(
                padding: const EdgeInsets.all(10.0),
                children: <Widget>[
                for (int index = 0; index < widget.exerciseData!.exerciseList!.length; index += 1)
                  InkWell(
                    key: Key('$index'),
                    // onTap: () {
                    // Navigator.of(context).push(
                    //     MaterialPageRoute(
                    //         builder: (ctx) =>
                    //             SelectExercise(exerciseModelLocalDB: exerciseData!
                    //                 .exerciseList![index],)));

                    // },
                    child: Column(
                      children: [
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
                                height: MediaQuery.of(context).size.height*0.02,
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
                  )
                ],
                onReorder: (int oldIndex, int newIndex) {
                  setState(() {
                    if (oldIndex < newIndex) {
                      newIndex -= 1;
                    }
                  final ExerciseModelLocalDB item = widget.exerciseData!.exerciseList!.removeAt(oldIndex) ;
                  widget.exerciseData!.exerciseList!.insert(newIndex, item);
                });
              },
            ),
          ),
        ),
      );
    });
  }
}

// import 'package:fitness_app/constants/colors.dart';
// import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
// import 'package:fitness_app/screens/home_page/open_home_page/open_home_page.dart';
// import 'package:fitness_app/screens/my_activity/replace_exercise_plan.dart';
// import 'package:fitness_app/widgets/color_remover.dart';
// import 'package:flutter/material.dart';
// import 'package:fitness_app/constants/constants.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fluttertoast/fluttertoast.dart';
//
// import '../../Helper/DBModels/day_model.dart';
// import '../../Helper/DBModels/exercise_model.dart';
// import '../../Utils/modal_progress_hud.dart';
// import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
//
// class EditPlan1 extends StatefulWidget {
//
//   EditPlan1({Key? key,this.dayModelLocalDB,required this.exerciseData}) : super(key: key);
//
//   DayModelLocalDB? dayModelLocalDB;
//   RequestExerciseData? exerciseData;
//
//   @override
//   State<EditPlan1> createState() => _EditPlan1State();
// }
//
// class _EditPlan1State extends State<EditPlan1> {
//
//   List<String> statusList = ['Replace', 'Delete'];
//   late HomeBloc _homeBloc;
//
//   // _onItemReorder(int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//   //   setState(() {
//   //     var movedItem = _contents[oldListIndex].children.removeAt(oldItemIndex);
//   //     _contents[newListIndex].children.insert(newItemIndex, movedItem);
//   //   });
//   // }
//
//   // _onListReorder(int oldListIndex, int newListIndex) {
//   //   setState(() {
//   //     var movedList = _contents.removeAt(oldListIndex);
//   //     _contents.insert(newListIndex, movedList);
//   //   });
//   // }
//
//   @override
//   void initState() {
//     super.initState();
//     _homeBloc = BlocProvider.of<HomeBloc>(context);
//     //_homeBloc.add(GetAllExerciseOfDayEvent(day: widget.dayModelLocalDB!.name));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     ExerciseConstants constants = ExerciseConstants();
//     return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
//       if (state is LoadingState) {
//       } else if (state is ErrorState) {
//         Fluttertoast.showToast(
//             msg: state.error,
//             toastLength: Toast.LENGTH_SHORT,
//             gravity: ToastGravity.BOTTOM,
//             timeInSecForIosWeb: 1,
//             backgroundColor: Colors.grey.shade400,
//             textColor: Colors.white,
//             fontSize: 12.0);
//       }else if (state is RefreshScreenState) {
//       } else if (state is GetAllExerciseState) {
//         widget.exerciseData = state.exerciseData;
//       }
//     }, builder: (context, state) {
//       return ModalProgressHUD(
//         inAsyncCall: state is LoadingState,
//         child: Scaffold(
//           backgroundColor: kColorBG,
//           appBar: AppBar(
//             backgroundColor: kColorBG,
//             title: const Text("EDIT PLAN"),
//           ),
//           body: ColorRemover(
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: ReorderableListView(
//                 physics: const BouncingScrollPhysics(),
//                 itemCount: widget.exerciseData != null
//                     ? widget.exerciseData!.exerciseList!.length
//                     : 0,
//                 itemBuilder: (ctx, index){
//                 return DragAndDropLists(
//                   // children: <DragAndDropItem> [
//                   //   DragAndDropItem(
//                   //     child: InkWell(
//                   //       onTap: () {
//                   //
//                   //       },
//                   //       child: Column(
//                   //         children: [
//                   //           Row(
//                   //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   //             children: [
//                   //               Row(
//                   //                 children: [
//                   //                   const Icon(
//                   //                     Icons.menu,
//                   //                     color: Colors.grey,
//                   //                     size: 22,
//                   //                   ),
//                   //                   SizedBox(width: MediaQuery.of(context).size.width*0.05),
//                   //                   ClipRRect(
//                   //                     borderRadius:
//                   //                     BorderRadius.circular(8.0),
//                   //                     child: Image(
//                   //                         height: 75,
//                   //                         width: 85,
//                   //                         fit: BoxFit.cover,
//                   //                         image: AssetImage(
//                   //                             "assets/images/${widget.exerciseData!.exerciseList![index].exercise.image}")),
//                   //                   ),
//                   //                   SizedBox(width: MediaQuery.of(context).size.width*0.05),
//                   //                   Column(
//                   //                     crossAxisAlignment: CrossAxisAlignment.start,
//                   //                     children: [
//                   //                       Text(
//                   //                         widget.exerciseData!.exerciseList![index].exercise.name,
//                   //                         style: TextStyle(
//                   //                           fontSize: MediaQuery.of(context).size.width*0.035,
//                   //                           fontWeight: FontWeight.bold,
//                   //                         ),
//                   //                       ),
//                   //                       const SizedBox(height: 6.0),
//                   //                       Text(
//                   //                         widget.exerciseData!.exerciseList![index].exercise.type!='rap'?"${widget.exerciseData!.exerciseList![index].time} mins":
//                   //                         "${widget.exerciseData!.exerciseList![index].raps} Raps",
//                   //                         style: const TextStyle(fontSize: 12),
//                   //                       ),
//                   //                     ],
//                   //                   ),
//                   //                 ],
//                   //               ),
//                   //               SizedBox(
//                   //                   width: MediaQuery.of(context).size.width*0.2,
//                   //                   height: MediaQuery.of(context).size.height*0.02,
//                   //                   child: Center(
//                   //                     child: Padding(
//                   //                       padding: const EdgeInsets.symmetric(horizontal: 5),
//                   //                       child: DropdownButton(
//                   //                         isExpanded: true,
//                   //                         underline: const SizedBox(),
//                   //                         dropdownColor: Colors.white,
//                   //                         icon: const Icon(
//                   //                           Icons.more_vert,
//                   //                           color: kColorPrimary,
//                   //                           size: 22,
//                   //                         ),
//                   //                         iconSize: 20,
//                   //                         style: const TextStyle(
//                   //                           fontSize: 15,
//                   //                           color: Colors.black,
//                   //                         ),
//                   //                         onChanged: (valueItem) {
//                   //                           if(valueItem=='Delete'){
//                   //                             _homeBloc.add(DeleteExerciseInADayEvent(exerciseData: widget.exerciseData!, index: index));
//                   //                           }
//                   //                           else if(valueItem=='Replace'){
//                   //                             Navigator.of(context).push(MaterialPageRoute(
//                   //                                 builder: (ctx) =>  ReplaceExercisePlan( dayModelLocalDB: widget.dayModelLocalDB,index: index, exerciseData: widget.exerciseData,)));
//                   //                           }
//                   //                         },
//                   //                         items: statusList.map((valueItem) {
//                   //                           return DropdownMenuItem(
//                   //                             child: Text(valueItem),
//                   //                             value: valueItem,
//                   //                             onTap: () {
//                   //                               _homeBloc.add(RefreshScreenEvent());
//                   //                             },
//                   //                           );
//                   //                         }).toList(),
//                   //                       ),
//                   //                     ),
//                   //                   )),
//                   //             ],
//                   //           ),
//                   //           const SizedBox(
//                   //             height: 10,
//                   //           ),
//                   //         ],
//                   //       ),
//                   //   ),
//                   // )],
//                   children: [
//                     InkWell(
//                       // children: DragAndDropItem(
//                       //   child: Text("")
//                       // )
//                     )
//                   ],
//                   onItemReorder: (int oldItemIndex, int oldListIndex, int newItemIndex, int newListIndex) {
//                     setState(() {
//                       // var movedItem = widget.exerciseData!.exerciseList![oldListIndex].children.removeAt(oldItemIndex);
//                       // widget.exerciseData!.exerciseList![newListIndex].children.insert(newItemIndex, movedItem);
//                     });
//                   },
//                   onListReorder: (int oldListIndex, int newListIndex) {
//                     setState(() {
//                       var movedList = widget.exerciseData!.exerciseList!.removeAt(oldListIndex);
//                       widget.exerciseData!.exerciseList!.insert(newListIndex, movedList);
//                     });
//                   },
//                 );
//               }, children: [
//
//               ],),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }