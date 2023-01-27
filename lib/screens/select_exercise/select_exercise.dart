import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/screens/home_page/open_activity.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/modal_progress_hud.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class SelectExercise extends StatefulWidget {
  ExerciseModelLocalDB exerciseModelLocalDB;

  SelectExercise({Key? key,required this.exerciseModelLocalDB, this.exerciseData, this.dayModelLocalDB}) : super(key: key);

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {

  late HomeBloc _homeBloc;
  int index = 0;
  // RequestExerciseData? exerciseData;
  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    print('>>>>>>>>>>>>>Excercise ID: ${widget.exerciseModelLocalDB.columnsId}');

    index=widget.exerciseModelLocalDB.columnsId!;
    // index=widget.dayModelLocalDB!.exerciseNumInProgress;
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
        widget.exerciseModelLocalDB=state.exerciseModelLocalDB;
      }else if (state is GetAllExerciseState) {
        widget.exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "${widget.exerciseModelLocalDB.columnsId}/${widget.exerciseData!=null? widget.exerciseData!.exerciseList!.length:'0'}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    // ${widget.exerciseModelLocalDB.columnsId}
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_circle_right,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  height: MediaQuery.of(context).size.height*0.065,
                  child: MyButton(
                    name: "Close",
                    whenpress: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text("Exercise Detail"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ColorRemover(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height*0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image:  DecorationImage(
                          image: AssetImage('assets/images/${widget.exerciseModelLocalDB.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Text(
                    widget.exerciseModelLocalDB.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.exerciseModelLocalDB.type!='rap'? "Duration":'Raps',style: const TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                if(widget.exerciseModelLocalDB.type=='rap'&& widget.exerciseModelLocalDB.raps>=1){
                                  _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: false, isDecrementing: true));
                                } else if () {

                                }
                              },
                              child: SizedBox(
                                  height:20,
                                  width:20,
                                  child: Icon(
                                    Icons.remove,
                                    color: Color(0xff1ce5c1),
                                  )
                              )
                          ),
                          const SizedBox(width: 10,),
                          Text(
                            widget.exerciseModelLocalDB.type!='rap'? widget.exerciseModelLocalDB.time:widget.exerciseModelLocalDB.raps.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 5,),
                          InkWell(onTap: (){
                            if( widget.exerciseModelLocalDB.type=='rap'){
                              _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: true, isDecrementing: false));
                            } else if() {

                            }
                          },
                          child: SizedBox(
                              height:20,
                              width:20,
                              child: Icon(
                                Icons.add,
                                color: Color(0xff1ce5c1),
                              )
                            )
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.015,
                  ),
                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        // Container(
                        //   width: double.infinity,
                        //   height: 25.h,
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(12.0),
                        //     image:  DecorationImage(
                        //         image: AssetImage('assets/images/${widget.exerciseModelLocalDB.image}'),
                        //         fit: BoxFit.cover),
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 18.0,
                        // ),
                        // Text(
                        //   widget.exerciseModelLocalDB.name,
                        //   style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                        // ),
                        // const SizedBox(
                        //   height: 18.0,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //      Text(
                        //         widget.exerciseModelLocalDB.type!='rap'? "Duration":'Raps',style: const TextStyle(fontSize: 20),
                        //     ),
                        //     Row(
                        //       children:  [
                        //
                        //          InkWell(
                        //              onTap: (){
                        //            if(widget.exerciseModelLocalDB.type=='rap'&& widget.exerciseModelLocalDB.raps>=1){
                        //              _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: false));
                        //            }
                        //          },child: const SizedBox(height:20,width:20,child: Icon(Icons.remove,))),
                        //         const SizedBox(width: 8,),
                        //         Text(
                        //             widget.exerciseModelLocalDB.type!='rap'? widget.exerciseModelLocalDB.time:widget.exerciseModelLocalDB.raps.toString(),style: const TextStyle(fontSize: 20),
                        //         ),
                        //         const SizedBox(width: 8,),
                        //          InkWell(onTap: (){
                        //            if( widget.exerciseModelLocalDB.type=='rap'){
                        //              _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: true));
                        //            }
                        //          },child: const SizedBox(height:20,width:20,child: Icon(Icons.add))),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 18.0,
                        // ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                        const SizedBox(
                          height: 18.0,
                        ),
                        const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );});
  }
}
