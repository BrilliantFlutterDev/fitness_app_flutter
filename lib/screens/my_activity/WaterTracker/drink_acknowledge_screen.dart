import 'package:fitness_app/screens/my_activity/WaterTracker/water_tracker.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';



class DrinkAcknowledge extends StatefulWidget {

  const DrinkAcknowledge({Key? key}) : super(key: key);

  @override
  State<DrinkAcknowledge> createState() => _DrinkAcknowledgeState();
}

class _DrinkAcknowledgeState extends State<DrinkAcknowledge> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1b20),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_sharp)
        ),
        actions: [
          Icon(Icons.settings),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          Image.asset('assets/icons/well_done.png'),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.02,
                bottom: MediaQuery.of(context).size.height*0.04),
            child: Text(
              'Well Done!',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Center(
            child: Text(
              'Drinking water helps improve fat burning rate.',
              style: TextStyle(color: Colors.white70, fontSize: 15),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: kColorPrimary),
              child: Center(
                child: Text(
                  'DONE',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      const WaterTracker()));
            },
            child: Container(
              height: 40,
              width: MediaQuery.of(context).size.width * 0.85,
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color: Colors.white),
              child: Center(
                child: Text(
                  'HISTORY',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}