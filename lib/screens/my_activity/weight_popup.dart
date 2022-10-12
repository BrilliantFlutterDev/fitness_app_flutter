import 'package:calender_picker/calender_picker.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/colors.dart';


class WeightPopup extends StatefulWidget{

  @override
  State<WeightPopup> createState() => _WeightPopupState();
}

class _WeightPopupState extends State<WeightPopup> {

  DateTime dateTime = DateTime.now();
  int days = 30;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 5, right: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Center(child: Text("October 2022")),
                      CalenderPicker(
                        dateTime,
                        daysCount: days,
                        // ignore: avoid_print
                        enableMultiSelection: true,
                        // ignore: avoid_print
                        multiSelectionListener: (value) => print(value),
                        selectionColor: kColorPrimary,
                        selectedTextColor: Colors.white,
                      ),
                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                          child: TextField()
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                        ),
                        child: Text(
                          "LG",
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Text(
                            "KG",
                            style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CusBottomBar(),
                              ),
                            );
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(color: Color(0xff1ce5c1), fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => CusBottomBar(),
                              ),
                            );
                          },
                          child: Text(
                            "SET",
                            style: TextStyle(color: Color(0xff1ce5c1), fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}