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
        const Duration(seconds: 5),
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
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset('assets/splash/3.0x/logo_flutterando.png'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/splash/logo_splash.gif', fit: BoxFit.contain, width: 200, height: 200)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
