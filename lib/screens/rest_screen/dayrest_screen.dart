import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DayRestScreen extends StatefulWidget {
  const DayRestScreen({Key? key}) : super(key: key);

  @override
  State<DayRestScreen> createState() => _DayRestScreenState();
}

class _DayRestScreenState extends State<DayRestScreen>{

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
          title: const Text("Rest Day"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: Colors.grey,
                child: Icon(Icons.energy_savings_leaf_outlined, color: Colors.white, size: 80,),
              ),
            ),
            Text("Your body and muscles need to get some rest",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.08,
              child: MyButton(
                name: "FINISHED",
                whenpress: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) =>
                          const CusBottomBar()),
                          (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ),
      );});
  }
}