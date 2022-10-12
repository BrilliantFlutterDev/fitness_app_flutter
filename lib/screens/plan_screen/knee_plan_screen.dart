import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/forget_password/forget_password.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/plan_screen/push_ups_spinner_screen.dart';
import 'package:fitness_app/screens/register_screen/register_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class SelectKneeIssueScreen extends StatefulWidget {
  const SelectKneeIssueScreen({Key? key}) : super(key: key);

  @override
  State<SelectKneeIssueScreen> createState() => _SelectKneeIssueScreenState();
}

class _SelectKneeIssueScreenState extends State<SelectKneeIssueScreen> {
  final List<bool> _selectedPlan = <bool>[true, false, false];

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

      }
    }, builder: (context, state) {
    return Scaffold(
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.9,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/5.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Color(0xff1c1b20),
                            Colors.transparent,
                          ],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height*0.96,
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "DO YOU HAVE KNEE ISSUE?",
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
                                    "Choose workout based on your condition",
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white70,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.05),
                            GestureDetector(
                              onTap: () {
                                _selectedPlan[2] = false;
                                _selectedPlan[1] = false;
                                _selectedPlan[0] = true;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  height: 12.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'I\'M FINE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                            color: _selectedPlan[0] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    // image: DecorationImage(
                                    //   image: AssetImage(
                                    //       "assets/images/${constants.standard[index].image}"),
                                    //   fit: BoxFit.cover,
                                    // ),
                                    gradient: LinearGradient(
                                      // begin: Alignment.bottomCenter,
                                      // end: Alignment.topCenter,
                                      colors: [
                                        _selectedPlan[0] == false
                                            ? const Color(0xff1c1b20)
                                            : Colors.white60,
                                        _selectedPlan[0] == false
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
                                _selectedPlan[0] = false;
                                _selectedPlan[2] = false;
                                _selectedPlan[1] = true;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.only(left: 12, right: 12),
                                child: Container(
                                  height: 12.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'NO JUMPING',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                            color: _selectedPlan[1] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    // image: DecorationImage(
                                    //   image: AssetImage(
                                    //       "assets/images/${constants.standard[index].image}"),
                                    //   fit: BoxFit.cover,
                                    // ),
                                    gradient: LinearGradient(
                                      // begin: Alignment.b,
                                      // end: Alignment.topCenter,
                                      colors: [
                                        _selectedPlan[1] == false
                                            ? const Color(0xff1c1b20)
                                            : Colors.white60,
                                        _selectedPlan[1] == false
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
                                _selectedPlan[0] = false;
                                _selectedPlan[1] = false;
                                _selectedPlan[2] = true;
                                setState(() {});
                              },
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  height: 12.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'LOW IMPACT',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25.0,
                                            color: _selectedPlan[2] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    // image: DecorationImage(
                                    //   image: AssetImage(
                                    //       "assets/images/${constants.standard[index].image}"),
                                    //   fit: BoxFit.cover,
                                    // ),
                                    gradient: LinearGradient(
                                      // begin: Alignment.bottomCenter,
                                      // end: Alignment.topCenter,
                                      colors: [
                                        _selectedPlan[2] == false
                                            ? const Color(0xff1c1b20)
                                            : Colors.white60,
                                        _selectedPlan[2] == false
                                            ? Colors.transparent
                                            : Colors.white,
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.1),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CusBottomBar()),
                                    (Route<dynamic> route) => false);
                              },
                              child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height:
                                      MediaQuery.of(context).size.height * 0.08,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          // color: Colors.white,
                                          // width: 2.0,
                                          ),
                                      borderRadius: BorderRadius.circular(100),
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
                                    'DONE',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ))),
                            ),
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
      ),
    );});
  }
}
