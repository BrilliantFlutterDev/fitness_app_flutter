import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/Feedback/feedback.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/quit_screens/reason_screen.dart';
import 'package:fitness_app/widgets/coming_soon_popup.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QuitScreen extends StatefulWidget {
  const QuitScreen({Key? key}) : super(key: key);

  @override
  State<QuitScreen> createState() => _QuitScreenState();
}

class _QuitScreenState extends State<QuitScreen> {

  final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    analytics.setCurrentScreen(screenName: "Quit Screen");
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height*0.07,
        width: AdmobHelper.getBannerAd().size.width.toDouble(),//double.infinity,
        child: AdWidget(
          ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
          key: UniqueKey(),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back)
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => UserFeedback(),
            ),
          );
        },
        child: Text(
          "Feedback",
          style: TextStyle(fontSize: 15,decoration: TextDecoration.underline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.075),
            Text(
              "Pause",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            // Text("Pause"),
            InkWell(
              onTap: (){
                showDialog(
                    context: context,
                    builder: (_) => Dialog(
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: ComingSoonPopup(),
                      ),
                    ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12.0),
                    right: Radius.circular(12.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      kColorFG,
                      kColorFG,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.03, horizontal: 10),
                  child: Text(
                    "RESTART THIS EXERCISE",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            InkWell(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        const QuitReasonScreen())
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12.0),
                    right: Radius.circular(12.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      kColorFG,
                      kColorFG,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.03, horizontal: 10),
                  child: Text(
                    "QUIT",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            // Text("Pause"),
            InkWell(
              onTap: (){
                Navigator.of(context).pop();
              },
              child: Container(
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.1,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(12.0),
                    right: Radius.circular(12.0),
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.topLeft,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.03, horizontal: 10),
                  child: Text(
                    "RESUME",
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}