import 'dart:async';

import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/screens/my_activity/MyActivityBloc/my_activity_bloc.dart';
import 'package:fitness_app/screens/my_activity/WaterTracker/drink_acknowledge_screen.dart';
import 'package:fitness_app/screens/my_activity/WaterTracker/water_tracker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../constants/colors.dart';

class AnimatedDrinkAcknowledge extends StatefulWidget {

  AnimatedDrinkAcknowledge({Key? key,}) : super(key: key);

  @override
  State<AnimatedDrinkAcknowledge> createState() => _AnimatedDrinkAcknowledgeState();
}

class _AnimatedDrinkAcknowledgeState extends State<AnimatedDrinkAcknowledge> {

  double value = 0;

  late MyActivityBloc _activityBloc;
  RequestDayData? requestDayData;

  @override
  void initState() {
    super.initState();
    _activityBloc = BlocProvider.of<MyActivityBloc>(context);
    _activityBloc.add(GetASpecificDaysEvent(day: 'Day ${AppGlobal.currentDay + 1}'));

    Timer(
        Duration(milliseconds: 1500),
            () => setState(() {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => DrinkAcknowledge()),
              );
        })
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<MyActivityBloc, MyActivityState>(
        listener: (context, state) {
      if (state is LoadingState) {
      } else if (state is ErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white,
            fontSize: 12.0);
      } else if (state is RefreshScreenState) {
      } else if (state is GetAllDaysState) {
        requestDayData = state.dayData;
        value = requestDayData!.exerciseList![0].noOfGlassWaterDrank * 12.5;
      }
    }, builder: (context, state) {
    return Scaffold(
      backgroundColor: kColorBG,
      appBar: AppBar(
        backgroundColor: kColorBG,
        // backgroundColor: const Color(0xff1c1b20),
        leading: InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_sharp)
        ),
        // actions: [
        //   Icon(Icons.settings),
        //   SizedBox(width: 10),
        // ],
      ),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*0.03),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.02, bottom: MediaQuery.of(context).size.height*0.04
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  requestDayData != null
                      ? requestDayData!.exerciseList![0]
                      .noOfGlassWaterDrank
                      .toString()
                      : '0',
                  style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  '/8',
                  style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  ' cups today',
                  style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.water_drop, color: Colors.lightBlue),
              SizedBox(width: 5),
              Text(
                'Most people need 8 cups(≈2000 ml) a day.',
                style: TextStyle(color: Colors.white70, fontSize: 15),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                child: SvgPicture.asset(
                  "assets/icons/waterglass.svg",
                  height: MediaQuery.of(context).size.height*0.25,
                  color: Colors.lightBlueAccent,
                ),
              ),
              // Image.asset('assets/icons/well_done.png'),
              Center(
                child: Text(
                  "${int.parse(value.ceil().toString())}%",
                  style: TextStyle(color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.1,
          ),
          Container(
            height: 45,
            width: MediaQuery.of(context).size.width * 0.85,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                    colors: [
                      Colors.blue,
                      Color(0xff1e1e1e),
                    ],
                  ),
            ),
            child: Center(
              child: Text(
                'Enjoy drinking...',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ],
      ),
    );
    });
  }
}