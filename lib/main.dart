import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: const Color(0xff1c1b20),
          primaryColor: Colors.black,
          // bottomAppBarColor: const Color(0xff1c1b20),
          applyElevationOverlayColor: true,
          appBarTheme: const AppBarTheme(
            elevation: 0.0,
            backgroundColor: Color(0xff1c1b20),
          ),
          colorScheme: const ColorScheme.dark(),
          iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
        ),
        home: const SelectPlanScreen(),
      );
    });
  }
}
