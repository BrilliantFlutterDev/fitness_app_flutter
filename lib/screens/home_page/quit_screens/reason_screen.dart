import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/account_screen/Feedback/feedback.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/screens/home_page/home_page.dart';
import 'package:fitness_app/widgets/cus_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class QuitReasonScreen extends StatefulWidget {
  const QuitReasonScreen({Key? key}) : super(key: key);

  @override
  State<QuitReasonScreen> createState() => _QuitReasonScreenState();
}

class _QuitReasonScreenState extends State<QuitReasonScreen> {

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
          style: TextStyle(fontSize: 15, decoration: TextDecoration.underline),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*0.09),
            Text(
              "Why give up?",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            Text(
              "This will help us know you better and provide the workout that is more suitable for you.",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            InkWell(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const CusBottomBar()),
                        (Route<dynamic> route) => false);
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
                    "Just take a look",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            InkWell(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const CusBottomBar()),
                        (Route<dynamic> route) => false);
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
                    "Too hard",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            // Text("Pause"),
            InkWell(
              onTap: (){
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const CusBottomBar()),
                        (Route<dynamic> route) => false);
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
                    "Don\'t know how to do it",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.025),
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: (){
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const CusBottomBar()),
                          (Route<dynamic> route) => false);
                },
                child: Text(
                  "Quit >",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}