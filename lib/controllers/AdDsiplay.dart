import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdDsiplay extends GetxController {
  bool isAddDisplayng = false;

  final adUnitIdInterstitial = 'ca-app-pub-8057878785129794/7420101079';

  Future loadInterstitial(VoidCallback fun) async {
    isAddDisplayng = true;
    await InterstitialAd.load(
        adUnitId: adUnitIdInterstitial,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          // Called when an ad is successfully received.
          onAdLoaded: (ad) async {
            debugPrint('$ad loaded.');
            // Keep a reference to the ad so you can show it later.
            await showInterstitial(ad);
            fun();
            Get.back();
          },
          // Called when an ad request failed.
          onAdFailedToLoad: (LoadAdError error) {
            Get.back();
            debugPrint('InterstitialAd failed to load: $error');
            isAddDisplayng = false;
          },
        ));
  }

  Future showInterstitial(InterstitialAd ad) async {
    await ad.show();
    isAddDisplayng = false;
    ;
  }
}
