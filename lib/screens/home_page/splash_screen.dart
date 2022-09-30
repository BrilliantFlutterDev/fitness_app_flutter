import 'dart:async';


import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../Utils/app_global.dart';
import '../../Utils/common_functions.dart';
import '../../Utils/modal_progress_hud.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  late HomeBloc _homeBloc;
  @override
  void initState() {
    super.initState();
    checkUserData();
    _homeBloc = BlocProvider.of<HomeBloc>(context);
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );

    @override
    void dispose() {
      _animationController.dispose();
      _animation.isDismissed; // you need this
      super.dispose();
    }

    _animation.addListener(() => setState(() {}));
    _animationController.forward();

    Timer(const Duration(seconds: 3), () {
      if (AppGlobal.rememberMe == 'true') {
        // _homeBloc.add(LoginUser(
        //     username: AppGlobal.rememberMeEmail,
        //     password: AppGlobal.rememberMePassword,
        //     rememberMe: 'Y'));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const SelectPlanScreen()));
      }
    });
  }

  void checkUserData() async {
    var temp = await getUserData();
    AppGlobal.rememberMe = temp.toString();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(listener: (context, state) {
      if (state is LoadingState) {
      } else if (state is ErrorState) {
      } else if (state is InternetErrorState) {
        Fluttertoast.showToast(
            msg: state.error,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.grey.shade400,
            textColor: Colors.white,
            fontSize: 12.0);
      }
    }, builder: (context, state) {
      return ModalProgressHUD(
        inAsyncCall: state is LoadingState,
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [

                      const SizedBox(
                        height: 20,
                      ),
                      Image.asset(
                        'assets/images/splash_icon.png',
                        width: _animation.value * 300,
                        //height: _animation.value * 300,
                      ),
                    ],
                  ),
                  const Text('Fit Fitness',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
