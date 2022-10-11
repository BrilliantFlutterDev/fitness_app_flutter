import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        appBar: AppBar(
          backgroundColor: const Color(0xff1c1b20),
          title: const Text("METRIC & IMPERIAL UNITS"),
        ),
        body: SafeArea(
          child: ColorRemover(
            child: Padding(
              padding: EdgeInsets.only(left: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) =>  Dialog(
                            child: Container(
                                height: MediaQuery.of(context).size.height*0.21,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      "Weight",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),
                                    RadioListTile(
                                      title: const Text("lbs"),
                                      value: Weight.lbs,
                                      groupValue: _selectedItem1,
                                      onChanged: (Weight? value) {
                                        setState(() {
                                          _selectedItem1 = value;
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("kg"),
                                      value: Weight.kg,
                                      groupValue: _selectedItem1,
                                      onChanged: (Weight? value) {
                                        setState(() {
                                          _selectedItem1 = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              // PopupMenuButton<Gender>(
                              //   itemBuilder: (BuildContext context) {
                              //     return List<PopupMenuEntry<Gender>>.generate(
                              //       Gender.values.length,
                              //           (int index) {
                              //         return PopupMenuItem(
                              //           value: Gender.values[index],
                              //           child: AnimatedBuilder(
                              //             child: Text(Gender.values[index].toString()),
                              //             animation: _selectedItem,
                              //             builder: (BuildContext context, Widget? child) {
                              //               return RadioListTile<Gender>(
                              //                 value: Gender.values[index],
                              //                 groupValue: _selectedItem.value,
                              //                 title: child,
                              //                 onChanged: (Gender? value) {
                              //                   _selectedItem.value = value!;
                              //                 },
                              //               );
                              //             },
                              //           ),
                              //         );
                              //       },
                              //     );
                              //   },
                              // ),
                            ),
                          )
                      );

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "lbs",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10,bottom: 10),
                    child: Divider(
                      height: 1,
                      color: Colors.white10,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) =>  Dialog(
                            child: Container(
                                height: MediaQuery.of(context).size.height*0.21,
                                child: Column(
                                  children: [
                                    SizedBox(height: 10),
                                    Text(
                                      "Height",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                                    ),

                                    RadioListTile(
                                      title: const Text("cm"),
                                      value: Height.cm,
                                      groupValue: _selectedItem2,
                                      onChanged: (Height? value) {
                                        setState(() {
                                          _selectedItem2 = value;
                                        });
                                      },
                                    ),
                                    RadioListTile(
                                      title: const Text("inch"),
                                      value: Height.inch,
                                      groupValue: _selectedItem2,
                                      onChanged: (Height? value) {
                                        setState(() {
                                          _selectedItem2 = value;
                                        });
                                      },
                                    ),
                                  ],
                                )
                              // PopupMenuButton<Gender>(
                              //   itemBuilder: (BuildContext context) {
                              //     return List<PopupMenuEntry<Gender>>.generate(
                              //       Gender.values.length,
                              //           (int index) {
                              //         return PopupMenuItem(
                              //           value: Gender.values[index],
                              //           child: AnimatedBuilder(
                              //             child: Text(Gender.values[index].toString()),
                              //             animation: _selectedItem,
                              //             builder: (BuildContext context, Widget? child) {
                              //               return RadioListTile<Gender>(
                              //                 value: Gender.values[index],
                              //                 groupValue: _selectedItem.value,
                              //                 title: child,
                              //                 onChanged: (Gender? value) {
                              //                   _selectedItem.value = value!;
                              //                 },
                              //               );
                              //             },
                              //           ),
                              //         );
                              //       },
                              //     );
                              //   },
                              // ),
                            ),
                          )
                      );

                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Height",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                "cm",
                                style: TextStyle(color: Colors.grey),
                              )
                            ],
                          )
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );});
  }
}