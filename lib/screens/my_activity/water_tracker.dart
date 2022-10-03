import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

class WaterTracker extends StatefulWidget {

  final List<Color> availableColors = const [
    Colors.purpleAccent,
    Colors.yellow,
    Colors.lightBlue,
    Colors.orange,
    Colors.pink,
    Colors.redAccent,
  ];

  WaterTracker({Key? key}) : super(key: key);

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker>{

  bool status = false;
  double value = 0;

  final Color barBackgroundColor = Colors.white;
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  bool isPlaying = false;

  @override
  Widget build(BuildContext context){
    var screenSize = MediaQuery.of(context).size;
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
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

      }
    }, builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff1c1b20),
        title: const Text("WATER TRACKER"),
      ),
      body: ColorRemover(
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 35.h,
                width: MediaQuery.of(context).size.width * 2,
                margin: const EdgeInsets.all(12),
                child: Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width * 2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.white10.withOpacity(0.4),
                        Colors.white10.withOpacity(0.4),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                            "Today",
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.085, right: MediaQuery.of(context).size.width*0.085),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    if(value == 0||value<0){
                                      value = 0;
                                    }else{
                                      value = value-12.5;
                                    }
                                  });
                                },
                                child: Text(
                                  '-',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 25),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              // height: 8.h,
                              // width: MediaQuery.of(context).size.width * 0.2,
                              // margin: const EdgeInsets.symmetric(vertical: 5),
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: SleekCircularSlider(
                                initialValue: value>100?100:value,
                                max: 100,
                                appearance: CircularSliderAppearance(
                                  // infoProperties: InfoProperties(),
                                  angleRange: 360,
                                  size: MediaQuery.of(context).size.width * 0.3,
                                  customWidths: CustomSliderWidths(
                                      progressBarWidth: 6.0, trackWidth: 5.0),
                                  customColors: CustomSliderColors(
                                    hideShadow: true,
                                    progressBarColor: Colors.blue,
                                    dotColor: Colors.transparent,
                                    trackColor: Colors.white,
                                    // trackColor: const Color(0xff404040),
                                    progressBarColors: [
                                      Colors.blue,
                                      Colors.blue,
                                    ],
                                  ),
                                ),
                                innerWidget: (re) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.water_drop_outlined,
                                          color: Colors.blue,
                                          size: 22,
                                        ),
                                        Text(
                                          '0 ',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 25,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          '/8 Cups',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                onChange: (e) {
                                   setState(() {
                                     if(value == 100 || value>100){
                                       value = 100;
                                     }else{
                                       value = value+12.5;
                                     }
                                   });
                                },
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: MaterialButton(
                                onPressed: () {
                                  setState(() {
                                    value = value+12.5;
                                  });
                                },
                                child: Text(
                                  '+',
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20,bottom: 15),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                          color: Colors.black38,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Drink notification",
                                style: TextStyle(fontSize: 17, color: Colors.black),
                              ),
                              Text(
                                "Remind me to drink",
                                style: TextStyle(fontSize: 13, color: Colors.black38),
                              ),
                            ],
                          ),
                          FlutterSwitch(
                            width: 50,
                            height: 25,
                            toggleSize: 10,
                            value: status,
                            borderRadius: 30,
                            padding: 8.0,
                            showOnOff: false,
                            onToggle: (val) {
                              setState(() {
                                status = val;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 4,left: 15),
                child: Text(
                    "September 2022",
                    style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                height: 35.h,
                width: MediaQuery.of(context).size.width * 2,
                margin: const EdgeInsets.all(12),
                child: Container(
                  height: 15.h,
                  width: MediaQuery.of(context).size.width * 2,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.topLeft,
                      colors: [
                        Colors.white10.withOpacity(0.4),
                        Colors.white10.withOpacity(0.4),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sep 18 - Sep 24",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17, color: Colors.black),
                                ),
                                Text(
                                  "2022",
                                  style: TextStyle(fontSize: 13, color: Colors.black38),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  "0.5",
                                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 23, color: Colors.black),
                                ),
                                Text(
                                  "Average(Cups)",
                                  style: TextStyle(fontSize: 13, color: Colors.black38),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      AspectRatio(
                        aspectRatio: 1.6,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
                          color: Colors.transparent,
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.01),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 30,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                        child: BarChart(
                                          isPlaying ? randomData() : mainBarData(),
                                          swapAnimationDuration: animDuration,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Align(
                              //     alignment: Alignment.topRight,
                              //     child: IconButton(
                              //       icon: Icon(
                              //         isPlaying ? Icons.pause : Icons.play_arrow,
                              //         color: Colors.white,
                              //       ),
                              //       onPressed: () {
                              //         setState(() {
                              //           isPlaying = !isPlaying;
                              //           if (isPlaying) {
                              //             refreshState();
                              //           }
                              //         });
                              //       },
                              //     ),
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
      ),
    );});
  }

  BarChartGroupData makeGroupData(
      int x,
      double y, {
        bool isTouched = false,
        Color barColor = Colors.blue,
        double width = 12,
        List<int> showTooltips = const [],
      }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          y: isTouched ? y + 1 : y,
          colors: isTouched ? [Colors.yellow] : [barColor],
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.yellow, width: 1)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            y: 20,
            colors: [barBackgroundColor],
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
    switch (i) {
      case 0:
        return makeGroupData(0, 1, isTouched: i == touchedIndex);
      case 1:
        return makeGroupData(1, 5.5, isTouched: i == touchedIndex);
      case 2:
        return makeGroupData(2, 7, isTouched: i == touchedIndex);
      case 3:
        return makeGroupData(3, 2, isTouched: i == touchedIndex);
      case 4:
        return makeGroupData(4, 0, isTouched: i == touchedIndex);
      case 5:
        return makeGroupData(5, 6, isTouched: i == touchedIndex);
      case 6:
        return makeGroupData(6, 8, isTouched: i == touchedIndex);
      default:
        return throw Error();
    }
  });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
            tooltipBgColor: Colors.blueGrey,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              String weekDay;
              switch (group.x.toInt()) {
                case 0:
                  weekDay = 'Monday';
                  break;
                case 1:
                  weekDay = 'Tuesday';
                  break;
                case 2:
                  weekDay = 'Wednesday';
                  break;
                case 3:
                  weekDay = 'Thursday';
                  break;
                case 4:
                  weekDay = 'Friday';
                  break;
                case 5:
                  weekDay = 'Saturday';
                  break;
                case 6:
                  weekDay = 'Sunday';
                  break;
                default:
                  throw Error();
              }
              return BarTooltipItem(
                weekDay + '\n',
                const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: (rod.y - 1).toString(),
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            }),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: SideTitles(showTitles: false),
        topTitles: SideTitles(showTitles: false),
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: getTitles,
          reservedSize: 5,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: FlGridData(show: false),
    );
  }

  String getTitles(double value) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'M';
        break;
      case 1:
        text = 'T';
        break;
      case 2:
        text = 'W';
        break;
      case 3:
        text = 'T';
        break;
      case 4:
        text = 'F';
        break;
      case 5:
        text = 'S';
        break;
      case 6:
        text = 'S';
        break;
      default:
        text = '';
        break;
    }
    return text;
  }

  BarChartData randomData() {
    return BarChartData(
      barTouchData: BarTouchData(
        enabled: false,
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          getTitles: getTitles,
          reservedSize: 38,
        ),
        leftTitles: SideTitles(
          showTitles: false,
        ),
        topTitles: SideTitles(
          showTitles: false,
        ),
        rightTitles: SideTitles(
          showTitles: false,
        )
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(0, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 1:
            return makeGroupData(1, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 2:
            return makeGroupData(2, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 3:
            return makeGroupData(3, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 4:
            return makeGroupData(4, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 5:
            return makeGroupData(5, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          case 6:
            return makeGroupData(6, Random().nextInt(15).toDouble() + 6,
                barColor: widget.availableColors[
                Random().nextInt(widget.availableColors.length)]);
          default:
            return throw Error();
        }
      }),
      gridData: FlGridData(show: false),
    );
  }

  Future<dynamic> refreshState() async {
    setState(() {});
    await Future<dynamic>.delayed(
        animDuration + const Duration(milliseconds: 50));
    if (isPlaying) {
      await refreshState();
    }
  }
}