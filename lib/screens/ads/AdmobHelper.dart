import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper{
  static String get bannerUnit => 'ca-app-pub-3940256099942544/6300978111';

  static initialization(){
    if(MobileAds.instance == null){
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd(){
    BannerAd myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',   //'<ad unit ID>'
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad){
          print('Ad Loaded Sucessfully');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error){
          print('Ad Loaded Failed');
          ad.dispose();
        },
        onAdOpened: (Ad ad){
          print('Ad Opened');
        },
      ),
    );

    return myBanner;
  }
}