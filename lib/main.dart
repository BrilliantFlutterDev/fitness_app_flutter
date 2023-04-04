import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:fitness_app/constants.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/AccountScreenBloc/account_screen_bloc.dart';
import 'package:fitness_app/screens/account_screen/Workout/notification_service.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/HomePageBloc/home_bloc.dart';
import 'package:fitness_app/screens/splash_screen/splash_screen.dart';
import 'package:fitness_app/screens/my_activity/MyActivityBloc/my_activity_bloc.dart';
import 'package:fitness_app/screens/plan_screen/plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialization();
  AwesomeNotifications().initialize(
      'resource://drawable/notification',
      [            // notification icon
        NotificationChannel(
          channelGroupKey: 'basic_test',
          channelKey: 'basic',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          channelShowBadge: true,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),
        //add more notification type with different configuration
      ]
  );

  await NotificationService().init();
  await NotificationService().requestIOSPermissions();

  var initializationSettingsAndroid = const AndroidInitializationSettings('notification');
  var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {});
  var initializationSettings = InitializationSettings(android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
  await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (payload) async {
    if (payload != null) {
      debugPrint('notification payload: ' + payload.toString());
    }
  });
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
            BlocProvider<AccountScreenBloc>(
              create: (context) => AccountScreenBloc(),
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
              colorScheme: const ColorScheme.dark(
                primary: kColorPrimary,
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