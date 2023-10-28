import 'package:fitness_app/Helper/DBModels/user_model.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/AccountScreenBloc/account_screen_bloc.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../account_screen1.dart';

class CountdownPopup extends StatefulWidget{

  const CountdownPopup({Key? key}) : super(key: key);

  @override
  State<CountdownPopup> createState() => _CountdownPopupState();
}

class _CountdownPopupState extends State<CountdownPopup> {

  late AccountScreenBloc _accountScreenBloc;
  double counter = 10;
  // late int value;
  // RequestUserData? requestUserData;
  // late UserDataModelLocalDB userDataModelLocalDB;

  @override
  void initState() {
    _accountScreenBloc = BlocProvider.of<AccountScreenBloc>(context);
    saveCountDown();

    super.initState();
  }

  void saveCountDown() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    counter = pref.getDouble('countdown')!;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context){
    return BlocConsumer<AccountScreenBloc, AccountScreenState>(listener: (context, state) {
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
      } else if (state is DataStoredState) {
        _accountScreenBloc.add(InsertAllUserDataInLocalDBEvent());
      }
      // else if (state is GetCountDownState){
      //   _counter = state.value;
      // }
    },
    builder: (context, state) {
    return Scaffold(
      body: ColorRemover(
        child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 25),
                    child: Text(
                      "Countdown time (10 ~ 15 sec)",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              if(counter == 10 || counter <= 10){
                                counter = 10;
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
                            // userDataModelLocalDB.countDownTime.toString(),
                            counter.ceil().toString(),
                            // value.toString(),
                            style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height*0.075),
                          ),
                          const Text(
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
                                if(counter == 15 || counter>=15){
                                  counter = 15;
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
                            pref.setDouble('countdown', counter);
                            // _accountScreenBloc.add(
                            //     CountDownEvent(value: _counter)
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
    );});
  }
}