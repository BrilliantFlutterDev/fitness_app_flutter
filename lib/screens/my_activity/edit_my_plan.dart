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

class EditMyPlan extends StatefulWidget {
  EditMyPlan({Key? key,this.dayModelLocalDB,required this.exerciseData}) : super(key: key);
  DayModelLocalDB? dayModelLocalDB;
  RequestExerciseData? exerciseData;

  @override
  State<EditMyPlan> createState() => _EditMyPlanState();
}

class _EditMyPlanState extends State<EditMyPlan> {

  List<String> statusList = ['Rename', 'Delete'];
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
        //exerciseData = state.exerciseData;
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("EDIT PLAN"),
        ),
        body: ColorRemover(
          child: ListView.builder(
            // shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: widget.exerciseData != null
                  ? widget.exerciseData!.exerciseList!.length
                  : 0,
              itemBuilder: (ctx, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const OpenHomePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 10.h,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(12),
                    child: Container(
                      height: 10.h,
                      width: MediaQuery.of(context).size.width * 2,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color(0xff1c1b20),
                            Colors.white70,
                          ],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 3.h,
                                width: MediaQuery.of(context).size.width * 0.09,
                                margin: const EdgeInsets.symmetric(vertical: 5),
                                decoration: new BoxDecoration(
                                  border: Border.all(color: kColorPrimary, width: 1),
                                  // image: new DecorationImage(
                                  //     image: '', fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                ),
                                child: Center(
                                  child: const Icon(
                                    Icons.add,
                                    color: kColorPrimary,
                                    size: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.exerciseData!.exerciseList![index].name,
                                    style: const TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                              width: 60,
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
                                    onChanged: (valueItem) {},
                                    items: statusList.map((valueItem) {
                                      return DropdownMenuItem(
                                        child: Text(valueItem),
                                        value: valueItem,
                                        onTap: () {
                                          setState(() {});
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              )),
                          // IconButton(
                          //   icon: const Icon(
                          //     Icons.menu,
                          //     color: kColorPrimary,
                          //   ),
                          //   onPressed: () {
                          //     setState(() {
                          //       Container(
                          //         height: 102,
                          //         width: 35,
                          //         child: DropdownButton<String>(
                          //             items: statusList.map((String val) {
                          //               return DropdownMenuItem<String>(
                          //                 value: val,
                          //                 child: Text(val),
                          //               );
                          //             }).toList(),
                          //             hint: Text('dadsa'),
                          //             onChanged: (val) {
                          //               setState(() {});
                          //             }),
                          //       );
                          //     });
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${widget.exerciseData!.exerciseList![index].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              }),
        ),
      );});
  }
}