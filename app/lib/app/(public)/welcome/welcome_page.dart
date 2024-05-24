import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/injector.dart';
import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final authController = injector.get<LoginControllerImpl>();

  UserEntity user = UserEntity.init();

  @override
  void initState() {
    super.initState();

    if (authController.state case SuccessState(:final data)) {
      setState(() {
        user = data as UserEntity;
      });
    }

    Future.delayed(const Duration(milliseconds: 1000), () {
      Routefly.navigate(routePaths.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    final name = user.name;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                    children: [
                      const TextSpan(text: 'Olá, '),
                      TextSpan(
                        text: '$name!',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Seja bem-vindo de volta!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.black),
                ),
              ],
            ),
          ),
          const Positioned.fill(
              child: Image(
            image: CooImages.cooBackgroundDetails,
            alignment: Alignment.bottomCenter,
          ))
        ],
      ),
    );
  }
}
