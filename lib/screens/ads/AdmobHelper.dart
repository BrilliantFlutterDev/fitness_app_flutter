import 'dart:io';

import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobHelper{
  static String get bannerUnit => 'ca-app-pub-3940256099942544/6300978111';

  InterstitialAd? _interstitialAd;
  int loadingAttempt = 0;

  AppOpenAd? openAd;

  static initialization(){
    if(MobileAds.instance == null){
      MobileAds.instance.initialize();
    }
  }

  static BannerAd getBannerAd(){
    BannerAd myBanner = BannerAd(
      adUnitId: Platform.isAndroid
          ? 'ca-app-pub-3940256099942544/6300978111'
          : 'ca-app-pub-3940256099942544/2934735716',   //'<ad unit ID>'
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (Ad ad){
          print('Banner Ad Loaded Sucessfully');
        },
        onAdFailedToLoad: (Ad ad, LoadAdError error){
          print('Banner Ad failed to load');
          ad.dispose();
        },
        onAdOpened: (Ad ad){
          print('Banner Ad Opened');
        },
      ),
    );

    return myBanner;
  }

  void loadInterstatialAd() {
    InterstitialAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/1033173712'
            : 'ca-app-pub-3940256099942544/4411468910',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            ad.fullScreenContentCallback = FullScreenContentCallback(
                onAdShowedFullScreenContent: (InterstitialAd ad) {},

                onAdImpression: (InterstitialAd ad) {},

                onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError err) {
                  ad.dispose();
                  loadInterstatialAd();
                },

                onAdDismissedFullScreenContent: (InterstitialAd ad) {
                  ad.dispose();
                },

                onAdClicked: (InterstitialAd ad) {}
            );

            _interstitialAd = ad;
            _interstitialAd?.show();
            _interstitialAd = null;
            loadingAttempt = 0;
            print('Interstitial Ad Loaded Sucessfully');
          },
          onAdFailedToLoad: (LoadAdError error) {
            loadingAttempt + 1;
            _interstitialAd = null;

            if(loadingAttempt<=2){
              loadInterstatialAd();
            }
            print('Interstitial Ad failed to load');
          },
        ));
  }

  // Future<void> loadOpenAd() async{
  //   await AppOpenAd.load(adUnitId: adUnitId, request: request, adLoadCallback: adLoadCallback, orientation: orientation)
  // }
  void loadAppOpenAd() {
    AppOpenAd.load(
        adUnitId: Platform.isAndroid
            ? 'ca-app-pub-3940256099942544/3419835294'
            : 'ca-app-pub-3940256099942544/5662855259',
        request: AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(
            onAdLoaded: (ad){
              ad.fullScreenContentCallback = FullScreenContentCallback(
                  onAdShowedFullScreenContent: (ad) {},

                  onAdImpression: (ad) {},

                  onAdFailedToShowFullScreenContent: (ad, err) {
                    ad.dispose();
                    openAd = null;
                    loadAppOpenAd();
                  },

                  onAdDismissedFullScreenContent: (ad) {
                    ad.dispose();
                  },

                  onAdClicked: (ad) {}
              );

              print('Open App Ad Loaded Sucessfully');
              openAd = ad;
              openAd!.show();
            },
            onAdFailedToLoad: (error){
              print('Open App Ad failed to load');
            }
        ),
        orientation: AppOpenAd.orientationPortrait
    );
  }

}