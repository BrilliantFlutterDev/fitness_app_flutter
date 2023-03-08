import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/my_activity/my_reports.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class ExerciseCompletedPopup extends StatefulWidget {
  const ExerciseCompletedPopup({Key? key}) : super(key: key);


  @override
  State<ExerciseCompletedPopup> createState() => _ExerciseCompletedPopupState();
}

class _ExerciseCompletedPopupState extends State<ExerciseCompletedPopup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kColorFG,
        body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "You have already completed \nthis task",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  // ElevatedButton(
                  //   onPressed: _calculate,
                  //   child: const Text('Calculate'),
                  // ),
                  // const SizedBox(
                  //   height: 30,
                  // ),
                  // Text(
                  //   _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                  //   style: const TextStyle(fontSize: 50),
                  //   textAlign: TextAlign.center,
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: kColorPrimary,
                      ),
                      child: const Center(
                        child: Text(
                          "OK",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                          //Icons.play_arrow,
                          //color: Colors.white,
                        ),
                      ),
                    ),
                    ),
                  // Text(
                  //   _message,
                  //   textAlign: TextAlign.center,
                  // )
                ],
              ),
            ),
          ),
        ));
  }
}