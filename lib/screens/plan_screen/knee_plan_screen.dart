import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:sizer/sizer.dart';

import '../../constants.dart';

class SelectKneeIssueScreen extends StatefulWidget {
  const SelectKneeIssueScreen({Key? key}) : super(key: key);

  @override
  State<SelectKneeIssueScreen> createState() => _SelectKneeIssueScreenState();
}

class _SelectKneeIssueScreenState extends State<SelectKneeIssueScreen> {
  final List<bool> _selectedPlan = <bool>[true, false, false];
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    addUserData();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  void addUserData() async {
    await storage.write(key: 'selectedKneeIssueOption', value: '1');
  }

  @override
  Widget build(BuildContext context) {
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
      } else if (state is RefreshScreenState) {}
    }, builder: (context, state) {
      return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
            width: AdmobHelper.getBannerAd().size.width.toDouble(), //double.infinity,
            child: AdWidget(
              ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
              key: UniqueKey(),
            ),
          ),
        ),
        body: ColorRemover(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.93,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/Bell Magic Workout.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              kColorBG.withOpacity(0.8),
                              kColorBG.withOpacity(0.8),
                            ],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height*0.93,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Align(
                                alignment: AlignmentDirectional.centerStart,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: const SizedBox(
                                    height: 30,
                                    //width: 35,
                                    child: Icon(
                                      Icons.arrow_back,
                                      //size: 35,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.02
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "DO YOU HAVE KNEE ISSUES?",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Align(
                                alignment: Alignment.center,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Choose workout based on your condition",
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: kColorPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.05
                              ),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[2] = false;
                                  _selectedPlan[1] = false;
                                  _selectedPlan[0] = true;

                                  if (AppGlobal.selectedKneeIssueOption != "1"){
                                    AppGlobal.selectedKneeIssueOption = "1";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedKneeIssueOption', value: '1'
                                  );
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'I\'M FINE',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: AppGlobal.selectedKneeIssueOption == '1'
                                              // _selectedPlan[0] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          AppGlobal.selectedKneeIssueOption == '1'
                                          // _selectedPlan[0] == false
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedKneeIssueOption == '1'
                                          // _selectedPlan[0] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[0] = false;
                                  _selectedPlan[2] = false;
                                  _selectedPlan[1] = true;

                                  if (AppGlobal.selectedKneeIssueOption != "2"){
                                    AppGlobal.selectedKneeIssueOption = "2";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedKneeIssueOption', value: '2'
                                  );
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 12, right: 12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'NO JUMPING',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: AppGlobal.selectedKneeIssueOption == '2'
                                              // _selectedPlan[1] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.b,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          AppGlobal.selectedKneeIssueOption == '2'
                                          // _selectedPlan[1] == false
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedKneeIssueOption == '2'
                                          // _selectedPlan[1] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5),
                              GestureDetector(
                                onTap: () async {
                                  _selectedPlan[0] = false;
                                  _selectedPlan[1] = false;
                                  _selectedPlan[2] = true;

                                  if (AppGlobal.selectedKneeIssueOption != "3"){
                                    AppGlobal.selectedKneeIssueOption = "3";
                                    AppGlobal.dataStoreFromConstantToLDB = "false";
                                    _homeBloc.add(ClearExerciseEvent());
                                    _homeBloc.add(RemoveDaysEvent());
                                  }
                                  await storage.write(
                                      key: 'selectedKneeIssueOption', value: '3'
                                  );
                                  _homeBloc.add(RefreshScreenEvent());
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  child: Container(
                                    height: 12.h,
                                    alignment: Alignment.bottomLeft,
                                    padding: const EdgeInsets.only(left: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'LOW IMPACT',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.0,
                                              color: AppGlobal.selectedKneeIssueOption == '3'
                                              // _selectedPlan[2] == false
                                                  ? Colors.black
                                                  : Colors.white
                                          ),
                                        ),
                                      ],
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                      gradient: LinearGradient(
                                        // begin: Alignment.bottomCenter,
                                        // end: Alignment.topCenter,
                                        colors: [
                                          AppGlobal.selectedKneeIssueOption == '3'
                                          // _selectedPlan[2] == false
                                              ? Colors.white60
                                              : const Color(0xff1c1b20),
                                          AppGlobal.selectedKneeIssueOption == '3'
                                          // _selectedPlan[2] == false
                                              ? Colors.white
                                              : Colors.transparent,
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                  height: MediaQuery.of(context).size.height * 0.1
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CusBottomBar()),
                                      (Route<dynamic> route) => false);
                                },
                                child: Container(
                                    width: MediaQuery.of(context).size.width * 0.6,
                                    height: MediaQuery.of(context).size.height * 0.08,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            // color: Colors.white,
                                            // width: 2.0,
                                            ),
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: kColorPrimary,
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.black26,
                                            spreadRadius: 1,
                                            blurRadius: 8,
                                            offset: Offset(0, 3),
                                          )
                                        ]),
                                    child: const Center(
                                        child: Text(
                                      'DONE',
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        // ),
      );
    });
  }
}
