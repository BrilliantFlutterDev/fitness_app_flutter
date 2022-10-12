import 'package:fitness_app/screens/my_activity/open_activity.dart';
import 'package:fitness_app/screens/start_exercise/start_exercise.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SelectExercise extends StatelessWidget {
  const SelectExercise({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (
                            ctx) => const OpenActivity(title: 'Close',)));
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
                    image: const DecorationImage(
                        image: AssetImage('assets/images/Soft Curve Workout.jpg'),
                        fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Text(
                  "MOUNTAIN CLIMBER",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                ),
                SizedBox(
                  height: 18.0,
                ),
                Row(
                  children: [
                    Text(
                        "Duration"
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width*0.4),
                    Icon(Icons.remove,),
                    Text(
                        "10:00"
                    ),
                    Icon(Icons.add),
                  ],
                ),
                SizedBox(
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
    );
  }
}
