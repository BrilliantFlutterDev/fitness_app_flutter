import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Helper/DBModels/exercise_model.dart';
import '../screens/home_page/HomePageBloc/home_bloc.dart';

class DeleteExercisePopup extends StatefulWidget {

  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;
  int index;

  DeleteExercisePopup({Key? key,this.dayModelLocalDB,required this.exerciseData, required this.index}) : super(key: key);

  @override
  State<DeleteExercisePopup> createState() => _DeleteExercisePopupState();
}

class _DeleteExercisePopupState extends State<DeleteExercisePopup> {

  late HomeBloc _homeBloc;

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
      }else if (state is RefreshScreenState) {
      } else if (state is GetAllExerciseState) {
        widget.exerciseData = state.exerciseData;
      }
    },
        builder: (context, state) {
          return Scaffold(
              backgroundColor: kColorFG,
              body: ColorRemover(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height*0.01,
                      left: MediaQuery.of(context).size.width*0.075,
                      right: MediaQuery.of(context).size.width*0.075,
                      bottom: MediaQuery.of(context).size.height*0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Are you sure you want to remove this exercise?",
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height*0.02),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                "CANCEL",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width*0.075),
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                                _homeBloc.add(DeleteExerciseInADayEvent(exerciseData: widget.exerciseData!, index: widget.index));
                                // _homeBloc.add(RefreshScreenEvent());
                              },
                              child: const Text(
                                "OK",
                                style: TextStyle(fontSize: 16, color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        });
  }
}