import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/states/auth_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final controller = injector.get<LoginControllerImpl>();

  @override
  void initState() {
    super.initState();

    controller.addListener(listener);

    if (mounted) {
      Future.delayed(
        const Duration(milliseconds: 5500),
        controller.checkSession,
      );
    }
  }

  void listener() async {
    return switch (controller.value) {
      AuthSuccess() =>
        Navigator.of(context).pushNamed<void>(routePaths.welcome),
      _ =>
        Navigator.of(context).pushNamed<void>(routePaths.auth.checkAffiliated),
    };
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
                Center(
                    child: Image(
                        image: CooGifs.cooSplashGif,
                        fit: BoxFit.contain,
                        width: 200,
                        height: 200)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
