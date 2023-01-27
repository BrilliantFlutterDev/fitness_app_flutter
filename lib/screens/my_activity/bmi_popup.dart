import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/my_activity/my_reports.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

class BMIPopup extends StatefulWidget {

  final Function(BMIUser) calBMI;
  BMIPopup(this.calBMI);

  @override
  State<BMIPopup> createState() => _BMIPopupState();
}

class _BMIPopupState extends State<BMIPopup> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04, left: MediaQuery.of(context).size.width*0.075),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "BMI",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Text(
                      "Weight (KG)",
                      style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: TextField(
                            keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              // labelText: "Weight",
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _weightController,
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "KG",
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "LB",
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04),
                  Text(
                    "Height (INCH)",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.5,
                          child: TextField(
                            keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                            decoration: const InputDecoration(
                              // labelText: "Height",
                              labelStyle: TextStyle(color: Colors.white),
                            ),
                            controller: _heightController,
                          ),
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "CM",
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),

                        // Container(
                        //   decoration: BoxDecoration(
                        //     border: Border.all(
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        //   child: Text(
                        //     "IN",
                        //     style: TextStyle(fontSize: 15),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
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
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(color: Color(0xff1ce5c1), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        InkWell(
                          onTap: (){
                            final user = BMIUser(double.parse(_heightController.value.text), double.parse(_weightController.value.text));
                            widget.calBMI(user);
                            // _calculate();
                            Navigator.pop(context);
                          },
                          child: Text(
                            "SAVE",
                            style: TextStyle(color: Color(0xff1ce5c1), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
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