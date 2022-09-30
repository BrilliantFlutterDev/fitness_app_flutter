import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class MyTrainer extends StatelessWidget {
  const MyTrainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ExerciseConstants constants = ExerciseConstants();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios)),
        backgroundColor: const Color(0xff1c1b20),
        title: const Text("My Trainer"),
      ),
      body: ColorRemover(
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: constants.chat.length,
            itemBuilder: (ctx, index) {
              return GestureDetector(
                onTap: () {
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image(
                            height: 80,
                            width: 90,
                            fit: BoxFit.cover,
                            image: AssetImage(
                                "assets/images/${constants.chat[index].image}")),
                      ),
                      const SizedBox(
                        width: 18.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            constants.chat[index].name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          const Text(
                            "Trainer",
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
