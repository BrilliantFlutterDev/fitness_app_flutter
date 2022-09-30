import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/my_activity/open_activity.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OpenHomePage extends StatelessWidget {
  const OpenHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    "Strecho Workout",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.control_point_duplicate_outlined,
                    color: Color(0xff1ce5c1),
                  ),
                  SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
              // const SizedBox(
              //   height: .0,
              // ),
              const Text(
                "90 hours | Amenda Johnson",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Strecho Workout.jpg'),
                  fit: BoxFit.cover),
            ),
          ),
        ),
        body: DefaultTabController(
          length: 3,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(12.0),
                right: Radius.circular(12.0),
              ),
              color: Color(0xff1c1b20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    // color: const Color(0xff38373a),
                  ),
                  child: const TabBar(
                    tabs: [
                      Tab(
                        text: ("Beginers"),
                      ),
                      Tab(
                        text: ("Skills"),
                      ),
                      Tab(
                        text: ("Master"),
                      ),
                    ],
                    indicatorColor: Colors.transparent,
                    labelColor: Color(0xff1ce5c1),
                    unselectedLabelColor: Colors.grey,
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  height: 60,
                  width: double.infinity,
                ),
                Expanded(
                  child: ColorRemover(
                    child: TabBarView(children: [
                      ColorRemover(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: constants.beginers.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>  OpenActivity(title: constants.beginers[index].name,)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 20.h,
                                  // alignment: Alignment.,
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, left: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        constants.beginers[index].name,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   height: .0,
                                      // ),
                                      Row(
                                        children: [
                                          Text(
                                            constants.beginers[index].lastMessage,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons
                                                .control_point_duplicate_outlined,
                                            color: Color(0xff1ce5c1),
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/${constants.beginers[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      ColorRemover(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: constants.skills.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>  OpenActivity(title: constants.beginers[index].name,)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 20.h,
                                  // alignment: Alignment.,
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, left: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        constants.skills[index].name,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   height: .0,
                                      // ),
                                      Row(
                                        children: [
                                          Text(
                                            constants.skills[index].lastMessage,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons
                                                .control_point_duplicate_outlined,
                                            color: Color(0xff1ce5c1),
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/${constants.skills[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                      ColorRemover(
                        child: ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: constants.beginers.length,
                            itemBuilder: (ctx, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>  OpenActivity(title: constants.beginers[index].name,)));
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 20.h,
                                  // alignment: Alignment.,
                                  padding: const EdgeInsets.only(
                                      bottom: 12.0, left: 12.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        constants.beginers[index].name,
                                        style: const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      // const SizedBox(
                                      //   height: .0,
                                      // ),
                                      Row(
                                        children: [
                                          Text(
                                            constants.beginers[index].lastMessage,
                                            style: const TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          const Spacer(),
                                          const Icon(
                                            Icons
                                                .control_point_duplicate_outlined,
                                            color: Color(0xff1ce5c1),
                                          ),
                                          const SizedBox(
                                            width: 12.0,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/${constants.beginers[index].image}"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
