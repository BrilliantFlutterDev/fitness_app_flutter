import 'package:fitness_app/screens/rest_screen/rest_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class StartExercise extends StatefulWidget {
  const StartExercise({Key? key}) : super(key: key);

  @override
  State<StartExercise> createState() => _StartExerciseState();
}

class _StartExerciseState extends State<StartExercise> {
  double vaule = 60.0;
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
                      height: MediaQuery.of(context).size.height * 0.40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/Wheel Stretch.jpg"),
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
                      height: MediaQuery.of(context).size.height * 0.40,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 0),
                        child: Column(
                          children: [
                            AppBar(
                              leading: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: const Icon(Icons.arrow_back_ios)),
                              backgroundColor: Colors.transparent,
                              actions: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.info_outline)),
                              ],
                            ),
                            const Spacer(),
                            const Text(
                              "Wheel Stretch",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            const Text(
                              "2 mins |1 set |15 reps",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SleekCircularSlider(
                          initialValue: vaule,
                          max: 100,
                          appearance: CircularSliderAppearance(
                            // infoProperties: InfoProperties(),
                            angleRange: 360,
                            size: MediaQuery.of(context).size.width * 0.5,
                            customWidths: CustomSliderWidths(
                                progressBarWidth: 12.0, trackWidth: 6.0),
                            customColors: CustomSliderColors(
                              hideShadow: true,
                              progressBarColor: const Color(0xff1ce5c1),
                              dotColor: Colors.transparent,
                              trackColor: const Color(0xff404040),
                              progressBarColors: [
                                const Color(0xff1ce5c1),
                                const Color(0xff1ce5c1),
                              ],
                            ),
                          ),
                          innerWidget: (re) {
                            return Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "0:30",
                                    style: TextStyle(
                                      fontSize: 40,
                                    ),
                                  ),
                                  Text(
                                    "mins",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          onChange: (e) {
                            setState(() {
                              vaule = e;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Center(
                  child: Container(
                    width: 150,
                    alignment: Alignment.center,
                    child: MyButton(name: "Stop", whenpress: () {}),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) =>const RestScreen()));
                  },
                  child: const Center(
                      child: Text(
                    "NEXT",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xff1ce5c1),
                      fontWeight: FontWeight.bold,
                    ),
                  )),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Full Crunches",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Text(
                        "5 mins |2 set |26 reps",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
