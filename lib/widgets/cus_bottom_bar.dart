import 'package:fitness_app/constants/colors.dart';
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
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: MediaQuery.of(context).size.width*0.06, right: MediaQuery.of(context).size.width*0.06),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: kColorPrimary,
                width: 1,
              )),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.black,

                // inputDecorationTheme: InputDecorationTheme(
                //     border: Border.all(
                //         color: kColorPrimary,
                //         width: 1,
                //     ),
                // )
                // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              ),

                child: BottomNavigationBar(
                  items: [
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: ImageIcon(
                            AssetImage("assets/icons/bottomplanicon.png"),
                            size: MediaQuery.of(context).size.height*0.03,
                          ),
                        ),
                        // icon: Icon(
                        //     Icons.accessibility
                        // ),
                        label: 'Plan'
                    ),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 3),
                          child: ImageIcon(
                            AssetImage("assets/icons/bottomreporticon.png"),
                            size: MediaQuery.of(context).size.height*0.03,
                          ),
                        ),
                        label: 'Reports'),
                    // BottomNavigationBarItem(
                    //     icon: Icon(Icons.chat_bubble), label: 'Messages'),
                    BottomNavigationBarItem(
                        icon: Padding(
                          padding: const EdgeInsets.only(bottom: 2),
                          child: ImageIcon(
                            AssetImage("assets/icons/bottomaccounticon.png"),
                            size: MediaQuery.of(context).size.height*0.0285,
                          ),
                        ),
                        label: 'Me'
                    ),
                  ],
                  currentIndex: selectedIndex,
                  type: BottomNavigationBarType.fixed,
                  unselectedIconTheme: const IconThemeData(
                    color: Colors.grey,
                  ),
                  // backgroundColor: Colors.black,

                  fixedColor: kColorPrimary,
                  onTap: onItemTapped,
                  selectedFontSize: 12,
                  unselectedFontSize: 12,
                ),
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
