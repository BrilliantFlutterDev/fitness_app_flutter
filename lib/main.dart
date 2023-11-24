import 'package:firebase_core/firebase_core.dart';
import 'package:fitness_app/screens/account_screen/Workout/notification_service.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/home_page/splash_screen.dart';
import 'package:fitness_app/screens/my_activity/MyActivityBloc/my_activity_bloc.dart';
import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import 'screens/AuthenticationScreens/loginBloc/login_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().init();
  await NotificationService().requestIOSPermissions();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
          providers: [
            BlocProvider<HomeBloc>(
              create: (context) => HomeBloc(),
            ),
            BlocProvider<MyActivityBloc>(
              create: (context) => MyActivityBloc(),
            ),
            BlocProvider<LoginBloc>(
              create: (context) => LoginBloc(),
            ),
          ],
          child: MaterialApp(
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
              colorScheme: ColorScheme.dark(
                primary: Color(0xff03dac6),
              ),
              iconTheme: const IconThemeData(color: Colors.white, opacity: 0.8),
            ),
            initialRoute: "/splashScreen",
            routes: <String, WidgetBuilder>{
              '/planSelect': (BuildContext context) => const SelectPlanScreen(),
              '/splashScreen': (BuildContext context) => const SplashScreen(),
              // '/loginPage': (BuildContext context) => const LoginScreen(),
              // '/signupPage': (BuildContext context) => SignupScreen(),
              // '/orderPlaced': (BuildContext context) => OrderDetails(
              //     previousPage: 'UserMyOrders',
              //     orderNumber: AppGlobal.notificationId.toString()),
              // '/accountScreen': (BuildContext context) => HomePage(
              //   currentTab: 3,
              // ),
              // '/notificationScreen': (BuildContext context) => HomePage(
              //   currentTab: 1,
              // ),
              // '/driverRegistrationScreen': (BuildContext context) =>
              // const DeliveryRegistrationScreen1(),
            },
            // home: const SelectPlanScreen(),
          ));
    });
  }
}
