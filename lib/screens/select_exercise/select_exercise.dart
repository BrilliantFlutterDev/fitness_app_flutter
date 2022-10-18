import 'package:fitness_app/Helper/DBModels/exercise_model.dart';
import 'package:fitness_app/screens/my_activity/open_activity.dart';
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
  SelectExercise({Key? key,required this.exerciseModelLocalDB}) : super(key: key);

  @override
  State<SelectExercise> createState() => _SelectExerciseState();
}

class _SelectExerciseState extends State<SelectExercise> {

  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    print('>>>>>>>>>>>>>Excercise ID: ${widget.exerciseModelLocalDB.columnsId}');

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
      }
    }, builder: (context, state) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          bottomNavigationBar: SizedBox(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_previous,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  "1/7",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.skip_next,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.4,
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
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            title: const Text("Exercise Detail"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ColorRemover(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Container(
                    width: double.infinity,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image:  DecorationImage(
                          image: AssetImage('assets/images/${widget.exerciseModelLocalDB.image}'),
                          fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Text(
                    widget.exerciseModelLocalDB.name,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                          widget.exerciseModelLocalDB.type!='rap'? "Duration":'Raps',style: const TextStyle(fontSize: 20),
                      ),
                      Row(
                        children:  [

                           InkWell(onTap: (){
                             if(widget.exerciseModelLocalDB.type=='rap'&& widget.exerciseModelLocalDB.raps>=1){
                               _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: false));

                             }
                           },child: const SizedBox(height:20,width:20,child: Icon(Icons.remove,))),
                          const SizedBox(width: 8,),
                          Text(
                              widget.exerciseModelLocalDB.type!='rap'? widget.exerciseModelLocalDB.time:widget.exerciseModelLocalDB.raps.toString(),style: const TextStyle(fontSize: 20),
                          ),
                          const SizedBox(width: 8,),
                           InkWell(onTap: (){
                             if( widget.exerciseModelLocalDB.type=='rap'){
                               _homeBloc.add(RapsTimeIncrementDecrementEvent(exerciseModelLocalDB: widget.exerciseModelLocalDB, isIncrementing: true));
                             }
                           },child: const SizedBox(height:20,width:20,child: Icon(Icons.add))),
                        ],
                      ),
                    ],
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
          ),
        ),
      ),
    );});
  }
}
