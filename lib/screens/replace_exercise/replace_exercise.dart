import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/home_page/open_activity.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../Utils/modal_progress_hud.dart';
import '../home_page/HomePageBloc/home_bloc.dart';

class ReplaceExercise extends StatefulWidget {

  ExerciseModelLocalDB exerciseModelLocalDB;
  ExerciseDetailModel exerciseDetailModel;
  int current_index;

  RequestExerciseData? exerciseData;
  DayModelLocalDB? dayModelLocalDB;

  ReplaceExercise({Key? key,
    required this.exerciseModelLocalDB, required this.exerciseDetailModel,this.exerciseData, this.dayModelLocalDB, required this.current_index
  }) : super(key: key);

  @override
  State<ReplaceExercise> createState() => _ReplaceExerciseState();
}

class _ReplaceExerciseState extends State<ReplaceExercise> {

  late HomeBloc _homeBloc;
  int index = 0;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
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
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.45,
                    height: MediaQuery.of(context).size.height*0.065,
                    child: MaterialButton(
                      shape: const StadiumBorder(),
                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "CANCEL",
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.45,
                    height: MediaQuery.of(context).size.height*0.065,
                    child: MyButton(
                      name: "REPLACE",
                      whenpress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                OpenActivity()
                            )
                        );
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
                          SizedBox(height: 10),
                          Text(
                            widget.exerciseModelLocalDB.exercise.description,
                            style: const TextStyle(fontSize: 17),
                            textAlign: TextAlign.justify,
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
      );
    });
  }
}