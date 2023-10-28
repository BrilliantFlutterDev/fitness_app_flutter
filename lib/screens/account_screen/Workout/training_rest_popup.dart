import 'package:fitness_app/Helper/DBModels/user_model.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/AccountScreenBloc/account_screen_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account_screen1.dart';

class TrainingRestPopup extends StatefulWidget{

  const TrainingRestPopup({Key? key}) : super(key: key);

  @override
  State<TrainingRestPopup> createState() => _TrainingRestPopupState();
}

class _TrainingRestPopupState extends State<TrainingRestPopup> {

  late AccountScreenBloc _accountScreenBloc;
  RequestUserData? requestUserData;
  int counter = 10;
  @override
  void initState() {
    super.initState();
    saveTrainingRest();
    _accountScreenBloc = BlocProvider.of<AccountScreenBloc>(context);
  }

  void saveTrainingRest() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    counter = pref.getInt('trainingrest')!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(left: 25, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Training rest (5 ~ 180 sec)",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if(counter == 5 || counter <= 5){
                                  counter = 5;
                                }else{
                                  counter -= 5;
                                }
                              });
                            },
                            child: const Icon(Icons.arrow_back_ios, color: Colors.grey, size: 20)),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Column(
                        children: [
                          Text(
                            counter.toString(),
                            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height*0.075),
                          ),
                          Text(
                            "sec",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.05),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                if(counter == 180 || counter>=180){
                                  counter = 180;
                                }else{
                                  counter += 5;
                                }
                              });
                            },
                            child: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 20)),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "CANCEL",
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(width: MediaQuery.of(context).size.width*0.1),
                        InkWell(
                          onTap: () async {
                            SharedPreferences pref = await SharedPreferences.getInstance();
                            pref.setInt('trainingrest', counter);
                            // _accountScreenBloc.add(
                            //     InsertAllUserDataInLocalDBEvent(
                            //       trainingRest: _counter
                            //     ),
                            // );
                            Navigator.pop(context, counter);
                          },
                          child: const Text(
                            "SET",
                            style: TextStyle(color: kColorPrimary, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}