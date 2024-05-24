import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/app/features/auth/interactor/states/auth_state.dart';
import 'package:coopartilhar/injector.dart';
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

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  void listener() async {
    if (controller.state is AuthLoading || controller.state is AuthInitial) {
      return;
    }

    return switch (controller.state) {
      AuthSuccess() => Routefly.navigate(routePaths.welcome),
      _ => Routefly.navigate(routePaths.auth.checkAffiliated),
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
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Image(image: CooImages.cooFlutterando3),
            ),
            Positioned(
              child: Center(
                child: Image(
                  image: CooGifs.cooSplashGif,
                  fit: BoxFit.contain,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
