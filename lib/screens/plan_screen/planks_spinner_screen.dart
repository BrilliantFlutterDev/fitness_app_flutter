import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/forget_password/forget_password.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/register_screen/register_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:vertical_picker/vertical_picker.dart';

import '../../constants.dart';
import 'knee_plan_screen.dart';

class PlanksSpinnerScreen extends StatefulWidget {
  const PlanksSpinnerScreen({Key? key}) : super(key: key);

  @override
  State<PlanksSpinnerScreen> createState() => _PlanksSpinnerScreenState();
}

class _PlanksSpinnerScreenState extends State<PlanksSpinnerScreen> {
  List<String> plankRanges = ['0-30s', '30-60s', '60-120s', 'Over 120s'];
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    addUserData();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  void addUserData() async {
    await storage.write(key: 'selectedPlankOption', value: '15');
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
      } else if (state is RefreshScreenState) {}
    }, builder: (context, state) {
      return Scaffold(
        body: ColorRemover(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.9,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Bell Magic Workout.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kColorBG.withOpacity(0.8),
                              kColorBG.withOpacity(0.8),
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const SizedBox(
                                    height: 30,
                                    //width: 35,
                                    child: Icon(
                                      Icons.arrow_back,
                                      //size: 35,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "HOW LONG CAN YOU HOLD A PLANK?",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "To personalize your plan",
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kColorPrimary,
                                        // fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  height:
                                  MediaQuery.of(context).size.height * 0.5,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                                  child: VerticalPicker(
                                    // give height for eacch item
                                    itemHeight: MediaQuery.of(context).size.height / 10,

                                    // margin for border
                                    leftMargin: 20,
                                    rightMargin: 30,

                                    // create list of text for items
                                    items: List.generate(
                                        plankRanges.length,
                                        (index) => Center(
                                              child: Text(
                                                plankRanges[index],
                                                style: const TextStyle(
                                                    fontSize: 30,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            )),

                                    // empty void for item selected
                                    onSelectedChanged: (indexSelected) async {
                                      await storage.write(
                                        key: 'selectedPlankOption',
                                        value: plankRanges[indexSelected] == '0-30s'?
                                                  AppGlobal.selectedPlankOption = '15' :
                                               plankRanges[indexSelected] == '30-60s'?
                                                  AppGlobal.selectedPlankOption = '40' :
                                               plankRanges[indexSelected] == '60-120s'?
                                                  AppGlobal.selectedPlankOption = '75' :
                                               plankRanges[indexSelected] == 'Over 120s'?
                                                  AppGlobal.selectedPlankOption = '90' :
                                               '30',
                                      );
                                      print('plank>>>>>> ${AppGlobal.selectedPlankOption}');
                                      _homeBloc.add(RefreshScreenEvent());
                                    },

                                    // give color to border
                                    borderColor: kColorPrimary,

                                    // thickness of border
                                    borderThickness: 3,
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 25),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const SelectKneeIssueScreen()));
                                },
                                child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    height: MediaQuery.of(context).size.height *
                                        0.08,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            // color: Colors.white,
                                            // width: 2.0,
                                            ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: kColorPrimary,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                    child: const Center(
                                        child: Text(
                                      'NEXT',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        // ),
      );
    });
  }
}
