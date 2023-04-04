import 'package:fitness_app/constants/colors.dart';
import 'package:fitness_app/screens/ads/AdmobHelper.dart';
import 'package:fitness_app/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class DayRestScreen extends StatefulWidget {
  const DayRestScreen({Key? key}) : super(key: key);

  @override
  State<DayRestScreen> createState() => _DayRestScreenState();
}

class _DayRestScreenState extends State<DayRestScreen>{

  @override
  Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: kColorBG,
        bottomNavigationBar: SizedBox(
          height: MediaQuery.of(context).size.height*0.07,
          width: AdmobHelper.getBannerAd().size.width.toDouble(),//double.infinity,
          child: AdWidget(
            ad:  AdmobHelper.getBannerAd()..load(),                 //myBanner..load(),
            key: UniqueKey(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: kColorBG,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_sharp)
          ),
          title: const Text("Rest Day"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Center(
              child: CircleAvatar(
                radius: 70,
                backgroundColor: kColorPrimary,
                // backgroundColor: Colors.grey,
                  child: LimitedBox(
                    child: SvgPicture.asset(
                      "assets/icons/coffecup.svg",
                      height: MediaQuery.of(context).size.height*0.1,
                      color: Colors.white,
                    ),
                  ),
                // Icon(Icons.energy_savings_leaf_outlined, color: kColorPrimary, size: 80,),
              ),
            ),
            const Text("Your body and muscles need to get some rest",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.8,
              height: MediaQuery.of(context).size.height*0.08,
              child: MyButton(
                name: "FINISHED",
                whenpress: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      );
  }
}