import 'package:fitness_app/constants.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';

import '../account_screen1.dart';

class CountdownPopup extends StatefulWidget{

  @override
  State<CountdownPopup> createState() => _CountdownPopupState();
}

class _CountdownPopupState extends State<CountdownPopup> {

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ColorRemover(
        child: Center(
          child: Container(
            // color: kThirdColor,
            height: MediaQuery.of(context).size.height*0.35,
            width: MediaQuery.of(context).size.width*0.85,
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Countdown time (10 ~ 15 sec)",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Icon(Icons.arrow_back_ios, color: Colors.grey, size: 15),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Column(
                        children: [
                          Text(
                              "10",
                              style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height*0.075),
                          ),
                          Text(
                            "sec",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 15),
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
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => AccountScreen1(),
                              ),
                            );
                        },
                          child: Text(
                            "CANCEL",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
          ),
        ),
      ),
    );
  }
}