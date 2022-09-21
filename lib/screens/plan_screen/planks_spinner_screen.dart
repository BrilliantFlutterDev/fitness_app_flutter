import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/forget_password/forget_password.dart';
import 'package:fitness_app/screens/register_screen/register_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
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
  List<String> pushUpsRanges = ['0-30s', '30-60s', '60-120s', 'Over 120s'];
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
                                  height: 35,
                                  width: 35,
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "HOW LONG CAN YOU HOLD A PLANK?",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "To personalize your plan",
                                    maxLines: 3,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white70,
                                      fontWeight: FontWeight.bold,
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
                                padding: const EdgeInsets.only(
                                    bottom: 12.0, left: 12.0),
                                child: VerticalPicker(
                                  // give height for eacch item
                                  itemHeight:
                                      MediaQuery.of(context).size.height / 10,

                                  // margin for border
                                  leftMargin: 70,
                                  rightMargin: 70,

                                  // create list of text for items
                                  items: List.generate(
                                      pushUpsRanges.length,
                                      (index) => Center(
                                            child: Text(
                                              pushUpsRanges[index],
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          )),

                                  // empty void for item selected
                                  onSelectedChanged: (indexSelected) {},

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
      ),
    );
  }
}
