import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MetricImperialUnits extends StatefulWidget {
  @override
  State<MetricImperialUnits> createState() => _MetricImperialUnitsState();
}

enum Weight {lbs, kg}
enum Height {cm, inch}

class _MetricImperialUnitsState extends State<MetricImperialUnits> {

  ValueNotifier<Weight> _selectedItem1 = new ValueNotifier<Weight>(Weight.lbs);
  ValueNotifier<Height> _selectedItem2 = new ValueNotifier<Height>(Height.cm);

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
                      Center(
                        child: PopupMenuButton<Weight>(
                          itemBuilder: (BuildContext context) {
                            return List<PopupMenuEntry<Weight>>.generate(
                              Weight.values.length,
                                  (int index) {
                                return PopupMenuItem(
                                  value: Weight.values[index],
                                  child: AnimatedBuilder(
                                    child: Text(Weight.values[index].toString()),
                                    animation: _selectedItem1,
                                    builder: (BuildContext context, Widget? child) {
                                      return RadioListTile<Weight>(
                                        value: Weight.values[index],
                                        groupValue: _selectedItem1.value,
                                        title: child,
                                        onChanged: (Weight? value) {
                                          _selectedItem1.value = value!;
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Weight Unit",
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
                      Center(
                        child: PopupMenuButton<Height>(
                          itemBuilder: (BuildContext context) {
                            return List<PopupMenuEntry<Height>>.generate(
                              Height.values.length,
                                  (int index) {
                                return PopupMenuItem(
                                  value: Height.values[index],
                                  child: AnimatedBuilder(
                                    child: Text(Height.values[index].toString()),
                                    animation: _selectedItem2,
                                    builder: (BuildContext context, Widget? child) {
                                      return RadioListTile<Height>(
                                        value: Height.values[index],
                                        groupValue: _selectedItem2.value,
                                        title: child,
                                        onChanged: (Height? value) {
                                          _selectedItem2.value = value!;
                                        },
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Height Unit",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              "in",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        )
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