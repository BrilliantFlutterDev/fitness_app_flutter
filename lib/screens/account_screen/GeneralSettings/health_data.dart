import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/foundation.dart';

class HealthData extends StatefulWidget {
  @override
  State<HealthData> createState() => _HealthDataState();
}

enum Gender {Male, Female}

class _HealthDataState extends State<HealthData> {

  ValueNotifier<Gender> _selectedItem = new ValueNotifier<Gender>(Gender.Male);

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
          title: const Text("HEALTH DATA"),
        ),
        body: SafeArea(
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
                        child: Center(
                          child: PopupMenuButton<Gender>(
                            itemBuilder: (BuildContext context) {
                              return List<PopupMenuEntry<Gender>>.generate(
                                Gender.values.length,
                                    (int index) {
                                  return PopupMenuItem(
                                    value: Gender.values[index],
                                    child: AnimatedBuilder(
                                      child: Text(Gender.values[index].toString()),
                                      animation: _selectedItem,
                                      builder: (BuildContext context, Widget? child) {
                                        return RadioListTile<Gender>(
                                          value: Gender.values[index],
                                          groupValue: _selectedItem.value,
                                          title: child,
                                          onChanged: (Gender? value) {
                                            _selectedItem.value = value!;
                                          },
                                        );
                                      },
                                    ),
                                  );
                                },
                              );
                            },
                          ),
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
                            "Gender",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            "Male",
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
                Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Date of Birth",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          "1990-01-01",
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      );});
    }
  }