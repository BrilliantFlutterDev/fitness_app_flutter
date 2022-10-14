import 'package:fitness_app/screens/account_screen/account_screen.dart';
import 'package:fitness_app/screens/account_screen/account_screen1.dart';
import 'package:fitness_app/screens/chat_screen/chat_screen.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/screens/my_activity/my_reports.dart';
import 'package:flutter/material.dart';

class CusBottomBar extends StatefulWidget {
  const CusBottomBar({Key? key}) : super(key: key);

  @override
  CusBottomBarState createState() => CusBottomBarState();
}

class CusBottomBarState extends State<CusBottomBar> {
  int selectedIndex = 0;
  final List<Widget> widgetOptions = [
    HomePage(),
    MyReports(),
    // const ChatScreen(),
    // const AccountScreen(),
    AccountScreen1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.black,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            ),
            child: BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.accessibility), label: 'Plan'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.equalizer), label: 'Reports'),
                // BottomNavigationBarItem(
                //     icon: Icon(Icons.chat_bubble), label: 'Messages'),
                BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Me'),
              ],
              currentIndex: selectedIndex,
              type: BottomNavigationBarType.fixed,
              unselectedIconTheme: const IconThemeData(
                color: Colors.grey,
              ),
              // backgroundColor: Colors.black,

              fixedColor: const Color(0xff1ce5c1),
              onTap: onItemTapped,
            ),
          ),
        ),
      ),
    );
  }

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
