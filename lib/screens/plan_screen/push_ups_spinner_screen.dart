import 'package:fitness_app/Utils/app_global.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/plan_screen/planks_spinner_screen.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vertical_picker/vertical_picker.dart';

class PushUpsSpinnerScreen extends StatefulWidget {
  const PushUpsSpinnerScreen({Key? key}) : super(key: key);

  @override
  State<PushUpsSpinnerScreen> createState() => _PushUpsSpinnerScreenState();
}

class _PushUpsSpinnerScreenState extends State<PushUpsSpinnerScreen> {
  List<String> pushUpsRanges = ['0-5', '5-10', '10-20', 'Over 20'];
  FlutterSecureStorage storage = const FlutterSecureStorage();
  late HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    addUserData();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
  }

  void addUserData() async {
    await storage.write(key: 'selectedPushUpOption', value: '4');    //pushUpsRanges[1]
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
                              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        "HOW MANY PUSH UPS CAN YOU DO AT A TIME?",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
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
                                      "To personalize your plan",
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
                              const SizedBox(height: 20),
                              Container(
                                margin: const EdgeInsets.all(12),
                                child: Container(
                                  height: MediaQuery.of(context).size.height * 0.5,
                                  alignment: Alignment.bottomLeft,
                                  padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
                                  child: VerticalPicker(
                                    // give height for eacch item
                                    itemHeight: MediaQuery.of(context).size.height / 10,

                                    // margin for border
                                    leftMargin: 20,
                                    rightMargin: 30,

                                    // create list of text for items
                                    items: List.generate(
                                      pushUpsRanges.length,
                                      (index) => Center(
                                          child: Text(
                                            pushUpsRanges[index],
                                            style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: Colors.black ),
                                          ),
                                        ),
                                    ),

                                    // empty void for item selected
                                    onSelectedChanged: (indexSelected) async {
                                      await storage.write(
                                        key: 'selectedPushUpOption',
                                        value: pushUpsRanges[indexSelected] == '0-5'?
                                                  AppGlobal.selectedPushUpOption = '3' :
                                               pushUpsRanges[indexSelected] == '5-10'?
                                                  AppGlobal.selectedPushUpOption = '7' :
                                               pushUpsRanges[indexSelected] == '10-20'?
                                                  AppGlobal.selectedPushUpOption = '13' :
                                               pushUpsRanges[indexSelected] == 'Over 20'?
                                                  AppGlobal.selectedPushUpOption = '15' :
                                               '10',
                                      );
                                      print('pushup>>>>>> ${AppGlobal.selectedPushUpOption}');
                                      _homeBloc.add(RefreshScreenEvent());
                                    },

                                    // give color to border
                                    borderColor: kColorPrimary,

                                    // thickness of border
                                    borderThickness: 3,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                      // image: DecorationImage(
                                      //   image: AssetImage(
                                      //       "assets/images/${constants.standard[index].image}"),
                                      //   fit: BoxFit.cover,
                                      // ),
                                    color: Colors.white
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                        const PlanksSpinnerScreen()));
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
                                      ]
                                  ),
                                  child: const Center(
                                    child: Text(
                                      'NEXT',
                                      style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
                                    )
                                  )),
                              )
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