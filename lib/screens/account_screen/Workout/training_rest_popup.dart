import 'package:fitness_app/constants.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

import '../account_screen1.dart';

class TrainingRestPopup extends StatefulWidget{

  @override
  State<TrainingRestPopup> createState() => _TrainingRestPopupState();
}

class _TrainingRestPopupState extends State<TrainingRestPopup> {

  int _counter = 10;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Training rest (5 ~ 180 sec)",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if(_counter == 5 || _counter <= 5){
                                  _counter = 5;
                                }else{
                                  _counter -= 5;
                                }
                              });
                            },
                            child: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20)),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Column(
                        children: [
                          Text(
                          '$_counter',
                            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height*0.075),
                          ),
                          Text(
                            "sec",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if(_counter == 180 || _counter>=180){
                                  _counter = 180;
                                }else{
                                  _counter += 5;
                                }
                              });
                            },
                            child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        Text(
                          "SET",
                          style: TextStyle(color: Color(0xff1ce5c1), fontWeight: FontWeight.bold),
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