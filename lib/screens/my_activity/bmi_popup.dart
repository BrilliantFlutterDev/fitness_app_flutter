import 'package:enum_to_string/enum_to_string.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/my_activity/my_reports.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account_screen/GeneralSettings/metric_imperial_units.dart';

class BMIPopup extends StatefulWidget {

  const BMIPopup({Key? key}) : super(key: key);

  @override
  State<BMIPopup> createState() => _BMIPopupState();
}

class _BMIPopupState extends State<BMIPopup> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String message = 'Please enter your height and weight';
  double? bmi;

  Weight selectedWeight = Weight.kg;
  Height selectedHeight = Height.inch;

  calculate(BMIUser user) async {
    if (user.height <= 0 || user.weight <= 0) {
      setState(() {
        message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    if(selectedWeight.name == 'kg' && selectedHeight.name == 'inch'){
      setState(() {
        bmi = user.weight / ((user.height/39.37) * (user.height/39.37));
        if (bmi! < 18.5) {
          message = "Underweight";
        } else if (bmi! < 25) {
          message = 'Healthy Weight';
        } else if (bmi! < 30) {
          message = 'Overweight';
        } else {
          message = 'Obese';
        }
      });
    }
    else if(selectedWeight.name == 'kg' && selectedHeight.name == 'cm'){
      setState(() {
        bmi = user.weight / ((user.height/100) * (user.height/100));
        if (bmi! < 18.5) {
          message = "Underweight";
        } else if (bmi! < 25) {
          message = 'Healthy Weight';
        } else if (bmi! < 30) {
          message = 'Overweight';
        } else {
          message = 'Obese';
        }
      });
    }
    else if(selectedWeight.name == 'lbs' && selectedHeight.name == 'inch'){
      setState(() {
        bmi = user.weight/2.205 / ((user.height/39.37) * (user.height/39.37));
        if (bmi! < 18.5) {
          message = "Underweight";
        } else if (bmi! < 25) {
          message = 'Healthy Weight';
        } else if (bmi! < 30) {
          message = 'Overweight';
        } else {
          message = 'Obese';
        }
      });
    }
    else if(selectedWeight.name == 'lbs' && selectedHeight.name == 'cm'){
      setState(() {
        bmi = user.weight/2.205 / ((user.height/100) * (user.height/100));
        if (bmi! < 18.5) {
          message = "Underweight";
        } else if (bmi! < 25) {
          message = 'Healthy Weight';
        } else if (bmi! < 30) {
          message = 'Overweight';
        } else {
          message = 'Obese';
        }
      });
    }
    print("BMI: $bmi");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble('bmi', bmi!);
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('bmi_message', message);
    message = prefs.getString('bmi')!;
  }

  void saveWeight() async {
    SharedPreferences prefsWeight = await SharedPreferences.getInstance();
    selectedWeight = EnumToString.fromString(Weight.values, prefsWeight.getString("weight").toString())!;
    setState(() {

    });
  }

  void saveHeight() async {
    SharedPreferences prefsHeight = await SharedPreferences.getInstance();
    selectedHeight = EnumToString.fromString(Height.values, prefsHeight.getString("height").toString())!;
    setState(() {

    });
  }

  @override
  void initState() {
    super.initState();
    saveWeight();
    saveHeight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorFG,
        body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.04, left: MediaQuery.of(context).size.width*0.075),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      "BMI",
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  const Text(
                      "Weight",
                      style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: TextField(
                            keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              hintText: '0.00 ${selectedWeight.name}',
                              // labelText: "Weight",
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                            controller: _weightController,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.075),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefsWeight = await SharedPreferences.getInstance();
                            prefsWeight.setString("weight", EnumToString.convertToString(Weight.kg)).then((val){
                              saveWeight();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: selectedWeight.name == 'kg' ? kColorPrimary : kColorFG,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "KG",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.05),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefsWeight = await SharedPreferences.getInstance();
                            prefsWeight.setString("weight", EnumToString.convertToString(Weight.lbs)).then((val){
                              saveWeight();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: selectedWeight.name == 'lbs' ? kColorPrimary : kColorFG,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "LB",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
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
                  const Text(
                    "Height",
                    style: TextStyle(fontSize: 18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.075),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: TextField(
                            keyboardType:
                            const TextInputType.numberWithOptions(decimal: true),
                            decoration: InputDecoration(
                              hintText: '0.00 ${selectedHeight.name}',
                              // labelText: "Height",
                              labelStyle: const TextStyle(color: Colors.white),
                            ),
                            controller: _heightController,
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.075),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefsHeight = await SharedPreferences.getInstance();
                            prefsHeight.setString("height", EnumToString.convertToString(Height.inch)).then((val){
                              saveHeight();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: selectedHeight.name == 'inch' ? kColorPrimary : kColorFG,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "IN",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.05),
                        InkWell(
                          onTap: () async {
                            SharedPreferences prefsHeight = await SharedPreferences.getInstance();
                            prefsHeight.setString("height", EnumToString.convertToString(Height.cm)).then((val){
                              saveHeight();
                            });
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: selectedHeight.name == 'cm' ? kColorPrimary : kColorFG,
                              border: Border.all(
                                color: Colors.black,
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                "CM",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
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
                          child: const Text(
                            "CANCEL",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        InkWell(
                          onTap: (){
                            final user = BMIUser(double.parse(_heightController.value.text), double.parse(_weightController.value.text));
                            // widget.calBMI(user);
                            calculate(user);
                            Navigator.pop(context, {'bmi': user, 'message': message});
                          },
                          child: const Text(
                            "SAVE",
                            style: TextStyle(color: kColorPrimary, fontWeight: FontWeight.bold),
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

class BMIUser{
  final double height;
  final double weight;

  BMIUser(this.height, this.weight);
}