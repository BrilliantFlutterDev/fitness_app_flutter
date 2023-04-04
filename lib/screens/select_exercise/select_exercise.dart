import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:video_player/video_player.dart';

import '../../Utils/modal_progress_hud.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class SelectExercise extends StatefulWidget {

  ExerciseModelLocalDB exerciseModelLocalDB;
  int current_index;

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;

  SelectExercise({Key? key,
    required this.exerciseModelLocalDB, this.exerciseData, this.dayModelLocalDB, required this.current_index
  }) : super(key: key);

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {

  late HomeBloc _homeBloc;
  int index = 0;
  // late VideoPlayerController _controller;

  // RequestExerciseData? exerciseData;
  void previousclick() {
    setState(() {
      widget.current_index!=1
          ? widget.current_index = widget.current_index-1
          : widget.current_index=1;
      widget.exerciseModelLocalDB = widget.exerciseData!.exerciseList![widget.current_index-1];
      // _controller = VideoPlayerController.asset('assets/images/${widget.exerciseModelLocalDB.exercise.video}');
      // _controller.addListener(() {
      //   setState(() {});
      // });
      // _controller.setLooping(true);
      // _controller.initialize().then((_) => setState(() {}));
      // _controller.play();
    });
    print(widget.current_index);
  }

  void nextclick() {
    setState(() {
      widget.current_index!=widget.exerciseData!.exerciseList!.length
          ? widget.current_index = widget.current_index+1
          : widget.current_index = widget.exerciseData!.exerciseList!.length;
      widget.exerciseModelLocalDB = widget.exerciseData!.exerciseList![widget.current_index+1-2];
      // _controller = VideoPlayerController.asset('assets/images/${widget.exerciseModelLocalDB.exercise.video}');
      // _controller.addListener(() {
      //   setState(() {});
      // });
      // _controller.setLooping(true);
      // _controller.initialize().then((_) => setState(() {}));
      // _controller.play();
    });
    print(widget.current_index);
  }

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);

    // _controller = VideoPlayerController.asset('assets/images/${widget.exerciseModelLocalDB.exercise.video}');
    //
    // _controller.addListener(() {
    //   setState(() {});
    // });
    // _controller.setLooping(true);
    // _controller.initialize().then((_) => setState(() {}));
    // _controller.play();
  }

  @override
  void dispose() {
    // _controller.dispose();
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
      } else if (state is UpdateAllExerciseState) {
        widget.exerciseModelLocalDB=state.exerciseModelLocalDB;
      } else if (state is GetAllExerciseState) {
        widget.exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          backgroundColor: kColorBG,
          bottomNavigationBar: SizedBox(
            height: MediaQuery.of(context).size.height*0.08,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {
                    previousclick();
                  },
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  widget.exerciseData!=null? "${widget.current_index}/${widget.exerciseData!.exerciseList!.length}" :"0/0",
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    // ${widget.exerciseModelLocalDB.columnsId}
                ),
                IconButton(
                  onPressed: () {
                    nextclick();
                  },
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
                    name: "CLOSE",
                    whenpress: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          appBar: AppBar(
            backgroundColor: kColorBG,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_sharp),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text("Exercise Detail"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: ColorRemover(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      // Container(
                      //   height: MediaQuery.of(context).size.height * 0.3,
                      //   child: AspectRatio(
                      //     aspectRatio: _controller.value.aspectRatio,
                      //     child: VideoPlayer(_controller),//VideoPlayerController.asset('assets/images/${widget.exerciseModelLocalDB.exercise.image}')
                      //   ),
                      // ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration:  BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage('assets/images/${widget.exerciseModelLocalDB.exercise.image}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: double.infinity,
                  //   height: MediaQuery.of(context).size.height*0.3,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(12.0),
                  //     image:  DecorationImage(
                  //         image: AssetImage('assets/images/${widget.exerciseModelLocalDB.exercise.image}'),
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Text(
                    widget.exerciseModelLocalDB.exercise.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.exerciseModelLocalDB.exercise.type!='rap'? "Duration":'Repeat',
                        style: const TextStyle(fontSize: 20),
                      ),
                      Row(
                        children: [
                          InkWell(
                              onTap: (){
                                if(widget.exerciseModelLocalDB.exercise.type=='rap'&& widget.exerciseModelLocalDB.raps>=1){
                                  _homeBloc.add(RapsIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: false, isDecrementing: true));
                                }
                                else if (widget.exerciseModelLocalDB.exercise.type=='time'&& widget.exerciseModelLocalDB.time>=1) {
                                  print('Time dec');
                                  _homeBloc.add(TimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: false, isDecrementing: true));
                                }
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                  ),
                                  // height:20,
                                  // width:20,
                                  child: const Center(
                                    child: Icon(
                                      Icons.remove,
                                      color: kColorPrimary,
                                      size: 18,
                                    ),
                                  )
                              ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            widget.exerciseModelLocalDB.exercise.type!='rap'? widget.exerciseModelLocalDB.time.toString():widget.exerciseModelLocalDB.raps.toString(),
                            style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 10),
                          InkWell(onTap: (){
                            if(widget.exerciseModelLocalDB.exercise.type=='rap'){
                              _homeBloc.add(RapsIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: true, isDecrementing: false));
                            } else if(widget.exerciseModelLocalDB.exercise.type=='time') {
                              print('Time inc');
                              _homeBloc.add(TimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: true, isDecrementing: false));
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white,
                                ),
                              ),
                              // height:20,
                              // width:20,
                              child: const Center(
                                child: Icon(
                                  Icons.add,
                                  color: kColorPrimary,
                                  size: 18,
                                ),
                              )
                            ),
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
                        const SizedBox(height: 10),
                        Text(
                          widget.exerciseModelLocalDB.exercise.description,
                          style: const TextStyle(fontSize: 17),
                          textAlign: TextAlign.justify,
                        ),
                        // const Text(
                        //   "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                        //   style: TextStyle(
                        //     fontSize: 18.0,
                        //   ),
                        // ),
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
