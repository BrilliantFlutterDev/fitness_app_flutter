import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:fitness_app/widgets/coming_soon_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

enum Weight {lbs, kg}
enum Height {cm, inch}

class MetricImperialUnits extends StatefulWidget {
  @override
  State<MetricImperialUnits> createState() => _MetricImperialUnitsState();
}

class _MetricImperialUnitsState extends State<MetricImperialUnits> {

  // ValueNotifier<Weight> _selectedItem1 = new ValueNotifier<Weight>(Weight.lbs);
  // ValueNotifier<Height> _selectedItem2 = new ValueNotifier<Height>(Height.cm);

  Weight? _selectedItem1 = Weight.lbs;
  Height? _selectedItem2 = Height.cm;

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
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ComingSoonPopup(),
                          ),
                        ));
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         content: StatefulBuilder(
                    //           builder: (BuildContext context, StateSetter setState) {
                    //             return Container(
                    //                 height: MediaQuery.of(context).size.height*0.24,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                   children: [
                    //                     // SizedBox(height: 10),
                    //                     Text(
                    //                       "Weight",
                    //                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    //                     ),
                    //                     RadioListTile(
                    //                       title: const Text("lbs"),
                    //                       value: Weight.lbs,
                    //                       groupValue: _selectedItem1,
                    //                       onChanged: (Weight? value) {
                    //                         setState(() {
                    //                           _selectedItem1 = value;
                    //                           Navigator.pop(context, _selectedItem1);
                    //                         });
                    //                       },
                    //                     ),
                    //                     RadioListTile(
                    //                       title: const Text("kg"),
                    //                       value: Weight.kg,
                    //                       groupValue: _selectedItem1,
                    //                       onChanged: (Weight? value) {
                    //                         setState(() {
                    //                           _selectedItem1 = value;
                    //                           Navigator.pop(context, _selectedItem1);
                    //                         });
                    //                       },
                    //                     ),
                    //                   ],
                    //                 )
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     }
                    // );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: Text(
                        "Weight",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        "lbs",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.white10,
                ),
                InkWell(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: ComingSoonPopup(),
                          ),
                        ));
                    // showDialog(
                    //     context: context,
                    //     builder: (BuildContext context) {
                    //       return AlertDialog(
                    //         content: StatefulBuilder(
                    //           builder: (BuildContext context, StateSetter setState) {
                    //             return Container(
                    //                 height: MediaQuery.of(context).size.height*0.24,
                    //                 child: Column(
                    //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //                   children: [
                    //                     Text(
                    //                       "Height",
                    //                       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    //                     ),
                    //
                    //                     RadioListTile(
                    //                       title: const Text("cm"),
                    //                       value: Height.cm,
                    //                       groupValue: _selectedItem2,
                    //                       onChanged: (Height? value) {
                    //                         setState(() {
                    //                           _selectedItem2 = value;
                    //                           Navigator.pop(context, _selectedItem2);
                    //                         });
                    //                       },
                    //                     ),
                    //                     RadioListTile(
                    //                       title: const Text("inch"),
                    //                       value: Height.inch,
                    //                       groupValue: _selectedItem2,
                    //                       onChanged: (Height? value) {
                    //                         setState(() {
                    //                           _selectedItem2 = value;
                    //                           Navigator.pop(context, _selectedItem2);
                    //                         });
                    //                       },
                    //                     ),
                    //                   ],
                    //                 )
                    //             );
                    //           },
                    //         ),
                    //       );
                    //     }
                    // );
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: ListTile(
                      title: Text(
                        "Height",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      subtitle: Text(
                        "cm",
                        style: TextStyle(color: Colors.grey),
                      )
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );});
  }
}