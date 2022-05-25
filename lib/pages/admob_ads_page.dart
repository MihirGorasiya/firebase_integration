// ignore_for_file: prefer_const_constructors, avoid_print, sort_child_properties_last, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobAdsPage extends StatefulWidget {
  const AdmobAdsPage({Key? key}) : super(key: key);

  @override
  State<AdmobAdsPage> createState() => _AdmobAdsPageState();
}

class _AdmobAdsPageState extends State<AdmobAdsPage> {
  late BannerAd myBanner;
  late AdWidget adWidget;
  InterstitialAd? interstitialAd;
  bool isBannerLoaded = false;

  @override
  void initState() {
    initializeBanner();
    initializeInterstitial();
    super.initState();
  }

  void initializeBanner() {
    final AdSize adSize = AdSize(width: 300, height: 50);
    myBanner = BannerAd(
      adUnitId: 'ca-app-pub-3940256099942544/6300978111',
      // size: AdSize.banner,
      size: adSize,
      request: AdRequest(),
      listener: BannerAdListener(),
    );

    myBanner.load();

    isBannerLoaded = true;
    setState(() {});
  }

  void initializeInterstitial() {
    InterstitialAd.load(
        adUnitId: 'ca-app-pub-3940256099942544/8691691433',
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            interstitialAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error');
          },
        ));

    interstitialAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('%ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        // ad.dispose();
        initializeInterstitial();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        // ad.dispose();
      },
      onAdImpression: (InterstitialAd ad) => print('$ad impression occurred.'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admob Ads")),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                interstitialAd?.show();
              },
              child: Text("Show interstitial"),
            ),
          ),
          Container(
            color: Colors.amberAccent[100],
            child: isBannerLoaded ? AdWidget(ad: myBanner) : Text("Banner Ad"),
            height: myBanner.size.height.toDouble(),
            width: myBanner.size.width.toDouble(),
          ),
        ],
      ),
    );
  }
}
