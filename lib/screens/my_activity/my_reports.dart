import 'package:calender_picker/date_picker_widget.dart';
import 'package:fitness_app/constants/constants.dart';
import 'package:fitness_app/screens/my_activity/bmi_popup.dart';
import 'package:fitness_app/screens/my_activity/water_tracker.dart';
import 'package:fitness_app/screens/my_activity/weight_popup.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/line_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../Helper/DBModels/day_model.dart';
import '../../Utils/app_global.dart';
import '../../Utils/modal_progress_hud.dart';
import '../../constants/colors.dart';
import 'MyActivityBloc/my_activity_bloc.dart';

class MyReports extends StatefulWidget {
  MyReports({Key? key}) : super(key: key);

  @override
  State<MyReports> createState() => _MyReportsState();
}

class _MyReportsState extends State<MyReports> {
  DateTime dateTime = DateTime.now();
  int days = 10;
  ExerciseConstants constants = ExerciseConstants();
  double value = 0;

  late MyActivityBloc _activityBloc;
  RequestDayData? requestDayData;

  String _message = 'Please enter your height and weight';
  double? _bmi;

  void _calculate(BMIUser user) {
    // final double? height = double.tryParse(_heightController.value.text);
    // final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (user.height == null ||
        user.height <= 0 ||
        user.weight == null ||
        user.weight <= 0) {
      setState(() {
        _message = "Your height and weigh must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = user.weight / (user.height * user.height);
      if (_bmi! < 18.5) {
        _message = "You are underweight";
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
      } else {
        _message = 'You are obese';
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _activityBloc = BlocProvider.of<MyActivityBloc>(context);

    _activityBloc
        .add(GetASpecificDaysEvent(day: 'Day ${AppGlobal.currentDay + 1}'));
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
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          //  backgroundColor: const Color(0xff1c1b20),
          appBar: AppBar(
            toolbarHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: const Color(0xff1c1b20),
            title: Padding(
              padding: EdgeInsets.only(left: 15, top: 20),
              child: Text(
                "KEEP IT UP!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          body: ColorRemover(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // const SizedBox(
                //   height: 20,
                // ),
                Container(
                  height: 15.h,
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
                          kColorPrimary.withOpacity(0.4),
                          kColorPrimary.withOpacity(0.4),
                        ],
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 9.h,
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: new BoxDecoration(
                                color: kColorPrimary,
                                // image: new DecorationImage(
                                //     image: '', fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                '31',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Text(
                              'WORKOUTS',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          height: 9.h,
                          width: 2,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 9.h,
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: new BoxDecoration(
                                color: kColorPrimary,
                                // image: new DecorationImage(
                                //     image: '', fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                '31.0',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Text(
                              'KCAL',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Container(
                          height: 9.h,
                          width: 2,
                          color: Colors.white,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 9.h,
                              width: MediaQuery.of(context).size.width * 0.2,
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              decoration: new BoxDecoration(
                                color: kColorPrimary,
                                // image: new DecorationImage(
                                //     image: '', fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                  child: Text(
                                '01:00',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                            Text(
                              'TIME(MIN)',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${constants.dailyExercises[0].image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 28.h,
                  width: MediaQuery.of(context).size.width * 2,
                  margin: const EdgeInsets.all(12),
                  child: Container(
                    height: 16.h,
                    width: MediaQuery.of(context).size.width * 2,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.white70,
                          Colors.white70,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'This week',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext context) =>
                                  //             HistoryScreen()));
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      'HISTORY',
                                      style: TextStyle(
                                        color: Color(0xff1ce5c1),
                                        fontSize: 15,
                                        // fontWeight: FontWeight.w500
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: Color(0xff1c1b20),
                                      size: 12,
                                    )
                                  ],
                                ),
                              ),

                              // InkWell(
                              //   onTap: () {
                              //     // setState(() {
                              //     //   SfDateRangePicker(
                              //     //     selectionMode: DateRangePickerSelectionMode.range,
                              //     //     view: DateRangePickerView.month,
                              //     //     onSelectionChanged: _onSelectionChanged,
                              //     //   );
                              //     // });
                              //   },
                              //   child: Container(
                              //       decoration: BoxDecoration(
                              //           color: const Color(0XFFEDF3FF),
                              //           borderRadius: BorderRadius.circular(10)),
                              //       child: const Padding(
                              //         padding: EdgeInsets.all(8.0),
                              //         child: Icon(
                              //           Icons.calendar_today,
                              //           color: Color(0XFF0342E9),
                              //         ),
                              //       )),
                              // ),
                            ],
                          ),
                        ),
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
                        Text(
                          '0 DAY IN ROW',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${constants.dailyExercises[0].image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const WaterTracker()));
                  },
                  child: Container(
                    //height: 25.h,
                    width: MediaQuery.of(context).size.width * 2,
                    margin: const EdgeInsets.all(12),
                    child: Container(
                      //height: 15.h,
                      width: MediaQuery.of(context).size.width * 2,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                            Colors.white70,
                            Colors.white70,
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Water tracker",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      requestDayData != null
                                          ? requestDayData!.exerciseList![0]
                                              .noOfGlassWaterDrank
                                              .toString()
                                          : '0',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      '  /8 Cups',
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  // height: 8.h,
                                  // width: MediaQuery.of(context).size.width * 0.2,
                                  // margin: const EdgeInsets.symmetric(vertical: 5),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  child: SleekCircularSlider(
                                    initialValue: value,
                                    max: 100,
                                    appearance: CircularSliderAppearance(
                                      // infoProperties: InfoProperties(),
                                      angleRange: 360,
                                      size: MediaQuery.of(context).size.width *
                                          0.15,
                                      customWidths: CustomSliderWidths(
                                          progressBarWidth: 6.0,
                                          trackWidth: 3.0),
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
                                      return const Center(
                                        child: Icon(
                                          Icons.hourglass_bottom,
                                          color: Colors.blue,
                                          size: 20,
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25.0),
                                color: Colors.blue),
                            child: Center(
                              child: Text(
                                'DRINK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/${constants.dailyExercises[3].image}"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 25.h,
                  width: MediaQuery.of(context).size.width * 2,
                  margin: const EdgeInsets.all(12),
                  child: Container(
                    // height: 15.h,
                    width: MediaQuery.of(context).size.width * 2,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.black54,
                          Colors.black54,
                        ],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Weight(lbs)',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              child: WeightPopup(),
                                            ),
                                          )); //CountdownPopup(),
                                },
                                child: Icon(
                                  Icons.add,
                                  size: 30,
                                  color: kColorPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 9.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: new BoxDecoration(
                                    color: kColorPrimary,
                                    // image: new DecorationImage(
                                    //     image: '', fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '31',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Text(
                                  'WORKOUTS',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Container(
                              height: 9.h,
                              width: 1,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 9.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: new BoxDecoration(
                                    color: kColorPrimary,
                                    // image: new DecorationImage(
                                    //     image: '', fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '31.0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 21,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Text(
                                  'KCAL',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Container(
                              height: 9.h,
                              width: 1,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 9.h,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 5),
                                  decoration: new BoxDecoration(
                                    color: kColorPrimary,
                                    // image: new DecorationImage(
                                    //     image: '', fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                      child: Text(
                                    '01:00',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                                Text(
                                  'TIME(MIN)',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const SizedBox(
                            height: 300,
                            width: double.infinity,
                            child: LineChartWidget()),
                      ],
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      image: AssetImage(
                          "assets/images/${constants.dailyExercises[2].image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  // height: 25.h,
                  width: MediaQuery.of(context).size.width * 2,
                  margin: const EdgeInsets.all(12),
                  child: Container(
                    // height: 15.h,
                    width: MediaQuery.of(context).size.width * 2,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.topLeft,
                        colors: [
                          Colors.black,
                          Colors.black,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'BMI',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) => Dialog(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.4,
                                              child: BMIPopup(_calculate),
                                            ),
                                          )); //CountdownPopup(),
                                },
                                child: Row(
                                  children: [
                                    Text("Edit"),
                                    SizedBox(width: 5),
                                    Icon(Icons.edit_outlined,
                                        size: 18, color: Colors.white),
                                  ],
                                ),
                                // Container(
                                //   height: 35,
                                //   width: 35,
                                //   decoration: BoxDecoration(
                                //       borderRadius: BorderRadius.circular(7.0),
                                //       color: kColorPrimary),
                                //   child: Center(
                                //     child: Icon(
                                //       Icons.add,
                                //       size: 30,
                                //       color: Colors.white,
                                //     ),
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text("BMI range and categories come from"),
                              Text(
                                " Wiki",
                                style: TextStyle(color: kColorPrimary),
                              ),
                              Text("."),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.075,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  _bmi == null
                                      ? 'No Result'
                                      : _bmi!.toStringAsFixed(2),
                                  textAlign: TextAlign.center,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.05,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.blueAccent,
                                            Colors.lightBlue,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.blue,
                                            Colors.lightBlueAccent,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.18,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: Colors.blueAccent,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.cyan,
                                            Colors.cyanAccent,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.amber,
                                            Colors.yellow,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.orange,
                                            Colors.orangeAccent,
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topRight,
                                          end: Alignment.topLeft,
                                          colors: [
                                            Colors.pink,
                                            Colors.redAccent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 7),
                                Row(
                                  children: [
                                    Text("15", style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.005),
                                    Text("16", style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.05),
                                    Text("18.5",
                                        style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.135),
                                    Text("25", style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.125),
                                    Text("30", style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.125),
                                    Text("35", style: TextStyle(fontSize: 12)),
                                    SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.1),
                                    Text("40", style: TextStyle(fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                            // LineChartWidget()
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            _message,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // const SizedBox(
                //     height: 300, width: double.infinity, child: LineChartWidget()),
                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: constants.recentActities.length,
                //     itemBuilder: (ctx, index) {
                //       return GestureDetector(
                //         onTap: () {
                //           Navigator.of(context).push(MaterialPageRoute(
                //               builder: (ctx) => const OpenActivity()));
                //         },
                //         child: Container(
                //           margin: const EdgeInsets.all(12),
                //           height: 20.h,
                //           // alignment: Alignment.,
                //           padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                //           child: Column(
                //             mainAxisAlignment: MainAxisAlignment.end,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 constants.recentActities[index].name,
                //                 style: const TextStyle(
                //                   fontSize: 20.0,
                //                 ),
                //               ),
                //               // const SizedBox(
                //               //   height: .0,
                //               // ),
                //               Row(
                //                 children: [
                //                   Text(
                //                     constants.recentActities[index].lastMessage,
                //                     style: const TextStyle(
                //                       fontSize: 14.0,
                //                       color: Colors.grey,
                //                     ),
                //                   ),
                //                   const Spacer(),
                //                   const Icon(
                //                     Icons.control_point_duplicate_outlined,
                //                     color: Color(0xff1ce5c1),
                //                   ),
                //                   const SizedBox(
                //                     width: 12.0,
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(12.0),
                //             image: DecorationImage(
                //               image: AssetImage(
                //                   "assets/images/${constants.recentActities[index].image}"),
                //               fit: BoxFit.cover,
                //             ),
                //           ),
                //         ),
                //       );
                //     }),
              ],
            ),
          ),
          // body:
        ),
      );
    });
  }

  different({DateTime? first, DateTime? last}) async {
    int data = last!.difference(first!).inDays;
    // ignore: avoid_print

    setState(() {
      data++;
      days = data;
      // ignore: avoid_print
      print(data);
    });
  }

  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      setState(() {
        dateTime = args.value.startDate;

        if (args.value.endDate != null) {
          different(first: args.value.startDate, last: args.value.endDate);
          // ignore: avoid_print
          print(args.value.startDate);
          // ignore: avoid_print
          print(args.value.endDate);
        }
      });
    }
  }
}

class BMIUser {
  final double height;
  final double weight;

  BMIUser(this.height, this.weight);
}
