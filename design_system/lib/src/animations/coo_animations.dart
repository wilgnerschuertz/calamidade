import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CooAnimations {
  static const String _packageName = 'design_system';

  static FutureBuilder _lottieBuilder(AssetLottie assetLottie) {
    return FutureBuilder<LottieComposition>(
      future: assetLottie.load(),
      builder: (_, snapshot) {
        final composition = snapshot.data;

        if (composition == null) {
          return const SizedBox.shrink();
        }

        return Lottie(
          composition: composition,
          repeat: false,
        );
      },
    );
  }

  static final cooSuccess = _lottieBuilder(
    AssetLottie(
      'assets/lotties/successAnimation.json',
      package: _packageName,
    ),
  );
}
