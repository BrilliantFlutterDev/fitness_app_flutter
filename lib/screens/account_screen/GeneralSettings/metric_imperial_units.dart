import 'package:enum_to_string/enum_to_string.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Weight {kg, lbs}
enum Height {inch, cm}

class MetricImperialUnits extends StatefulWidget {

  const MetricImperialUnits({Key? key}) : super(key: key);

  @override
  State<MetricImperialUnits> createState() => _MetricImperialUnitsState();
}

class _MetricImperialUnitsState extends State<MetricImperialUnits> {

  Weight selectedWeight = Weight.kg;
  Height selectedHeight = Height.inch;

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    saveWeight();
    saveHeight();
    analytics.setCurrentScreen(screenName: "Metric Imperial Units Screen");
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
  Widget build(BuildContext context){
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
        backgroundColor: kColorBG,
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
          width: AdmobHelper.getBannerAd().size.width.toDouble(),//double.infinity,
          child: AdWidget(
            ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
            key: UniqueKey(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kColorBG,
          title: const Text("METRIC & IMPERIAL UNITS"),
        ),
        body: SafeArea(
          child: ColorRemover(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    // showDialog(
                    //     context: context,
                    //     builder: (_) => Dialog(
                    //       child: SizedBox(
                    //         height: MediaQuery.of(context).size.height * 0.3,
                    //         child: ComingSoonPopup(),
                    //       ),
                    //     ));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: kColorFG,
                            content: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Container(
                                    height: MediaQuery.of(context).size.height*0.24,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        // SizedBox(height: 10),
                                        const Text(
                                          "Weight Unit",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                        ),
                                        RadioListTile(
                                          activeColor: kColorPrimary,
                                          title: const Text("kg"),
                                          value: Weight.kg,
                                          groupValue: selectedWeight,
                                          onChanged: (Weight? value) async {
                                            setState(() {
                                              selectedWeight = Weight.kg;
                                              Navigator.pop(context);
                                            });
                                            SharedPreferences prefsWeight = await SharedPreferences.getInstance();
                                            prefsWeight.setString("weight", EnumToString.convertToString(Weight.kg));
                                          },
                                        ),
                                        RadioListTile(
                                          activeColor: kColorPrimary,
                                          title: const Text("lbs"),
                                          value: Weight.lbs,
                                          groupValue: selectedWeight,
                                          onChanged: (Weight? value) async {
                                            setState(() {
                                              selectedWeight = Weight.lbs;
                                              Navigator.pop(context);
                                            });
                                            SharedPreferences prefsWeight = await SharedPreferences.getInstance();
                                            prefsWeight.setString("weight", EnumToString.convertToString(Weight.lbs));
                                          },
                                        ),
                                      ],
                                    )
                                );
                              },
                            ),
                          );
                        }
                    ).then((value) {
                      saveWeight();
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: const Text(
                        "Weight Unit",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        selectedWeight.name,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                  color: Colors.white10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: kColorFG,
                            content: StatefulBuilder(
                              builder: (BuildContext context, StateSetter setState) {
                                return Container(
                                    height: MediaQuery.of(context).size.height*0.24,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        // SizedBox(height: 10),
                                        const Text(
                                          "Height Unit",
                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
                                        ),
                                        RadioListTile(
                                          activeColor: kColorPrimary,
                                          title: const Text("inch"),
                                          value: Height.inch,
                                          groupValue: selectedHeight,
                                          onChanged: (Height? value) async {
                                            setState(() {
                                              selectedHeight = Height.inch;
                                              Navigator.pop(context);
                                            });
                                            SharedPreferences prefsHeight = await SharedPreferences.getInstance();
                                            prefsHeight.setString("height", EnumToString.convertToString(Height.inch));
                                          },
                                        ),
                                        RadioListTile(
                                          activeColor: kColorPrimary,
                                          title: const Text("cm"),
                                          value: Height.cm,
                                          groupValue: selectedHeight,
                                          onChanged: (Height? value) async {
                                            setState(() {
                                              selectedHeight = Height.cm;
                                              Navigator.pop(context);
                                            });
                                            SharedPreferences prefsHeight = await SharedPreferences.getInstance();
                                            prefsHeight.setString("height", EnumToString.convertToString(Height.cm));
                                          },
                                        ),
                                      ],
                                    )
                                );
                              },
                            ),
                          );
                        }
                    ).then((value) {
                      saveHeight();
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: const Text(
                        "Height Unit",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        selectedHeight.name,
                        style: const TextStyle(color: Colors.grey),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}