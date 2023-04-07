import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/Helper/DBModels/day_model.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/AccountScreenBloc/account_screen_bloc.dart';
import 'package:fitness_app/screens/my_activity/my_reports.dart';
import 'package:fitness_app/widgets/color_remover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ResetPopup extends StatefulWidget {

  const ResetPopup({Key? key}) : super(key: key);

  @override
  State<ResetPopup> createState() => _ResetPopupState();
}

class _ResetPopupState extends State<ResetPopup> {

  late AccountScreenBloc _accountScreenBloc;
  DayModelLocalDB? dayModelLocalDB;
  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _accountScreenBloc = BlocProvider.of<AccountScreenBloc>(context);
    analytics.setCurrentScreen(screenName: "Reset Exercise Popup");
  }

  @override
  Widget build(BuildContext context) {
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
      } else if (state is UpdateDayProgressState) {
        dayModelLocalDB = state.dayModelLocalDB;
      }
    },
    builder: (context, state) {
      return Scaffold(
        backgroundColor: kColorFG,
        body: ColorRemover(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height*0.01,
                left: MediaQuery.of(context).size.width*0.075,
                right: MediaQuery.of(context).size.width*0.075,
                bottom: MediaQuery.of(context).size.height*0.01,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Restart Progress",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "CANCEL",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width*0.075),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                          _accountScreenBloc.add(ChangeExerciseStatusToResetEvent());
                        },
                        child: const Text(
                          "OK",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
    });
  }
}