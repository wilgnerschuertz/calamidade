import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    if (mounted) {
      Future.delayed(
        const Duration(milliseconds: 5500),
        () {
          Routefly.navigate(routePaths.onboarding);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: CooImages.cooBackgroundDetails,
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
          ),
        ),
        child: const Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image(image: CooImages.cooFlutterando3),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image(image: CooImages.cooSplashGif, fit: BoxFit.contain, width: 200, height: 200)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
