import 'package:fitness_app/screens/forget_password/forget_password.dart';
import 'package:fitness_app/screens/plan_screen/push_ups_spinner_screen.dart';
import 'package:fitness_app/screens/register_screen/register_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';
import '../../constants/colors.dart';

class SelectPlanScreen extends StatefulWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  @override
  State<SelectPlanScreen> createState() => _SelectPlanScreenState();
}

class _SelectPlanScreenState extends State<SelectPlanScreen> {
  final List<bool> _selectedPlan = <bool>[true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ColorRemover(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height,
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
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 0),
                        child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     const Text(
                            //       "Sign in",
                            //       style: TextStyle(
                            //         fontSize: 18,
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //       ),
                            //     ),
                            //     InkWell(
                            //       onTap: () {
                            //         // Navigator.of(context).pop();
                            //         Navigator.of(context).push(
                            //             MaterialPageRoute(
                            //                 builder: (ctx) =>
                            //                     const Register()));
                            //       },
                            //       child: Row(
                            //         children: const [
                            //           Text(
                            //             "+ ",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               color: kFirstColor,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //           Text(
                            //             "Register",
                            //             style: TextStyle(
                            //               fontSize: 18,
                            //               color: Colors.white,
                            //               fontWeight: FontWeight.bold,
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     )
                            //   ],
                            // ),
                            // RichText(
                            //   text: TextSpan(
                            //     text: 'Sign in\t',
                            //     style: const TextStyle(
                            //       fontFamily: "Bebas",
                            //       fontSize: 20,
                            //     ),
                            //     children: <InlineSpan>[
                            //       WidgetSpan(
                            //           alignment: PlaceholderAlignment.baseline,
                            //           baseline: TextBaseline.alphabetic,
                            //           child: SizedBox(width: 33.w)),
                            //       const TextSpan(
                            //         text: 'ELEMENT',
                            //         style: TextStyle(color: kFirstColor),
                            //       )
                            //     ],
                            //   ),
                            // ),

                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "CHOOSE YOUR PLAN",
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),

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
                                  height: 10.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'BEGINNER',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: _selectedPlan[0] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      Text(
                                        '5-10 min a day',
                                        style: TextStyle(
                                            fontSize: 15.0,
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
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  height: 10.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'INTERMEDIATE',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: _selectedPlan[1] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      Text(
                                        '10-20 min a day',
                                        style: TextStyle(
                                            fontSize: 15.0,
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
                                  height: 10.h,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'ADVANCED',
                                        style: TextStyle(
                                            fontSize: 30.0,
                                            color: _selectedPlan[2] == false
                                                ? Colors.white
                                                : Colors.black),
                                      ),
                                      Text(
                                        '15-30 min a day',
                                        style: TextStyle(
                                            fontSize: 15.0,
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

                            const SizedBox(height: 50),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            const PushUpsSpinnerScreen()));
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
                                    'NEXT',
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
    );
  }
}