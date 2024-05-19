import 'package:coopartilhar/app/features/auth/interactor/entities/user_entity.dart';
import 'package:coopartilhar/app/features/check_affiliated/interactor/check_affiliated_controller.dart';
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
  final userController = injector.get<CheckAffiliatedController>();

  UserEntity user = UserEntity.init();

  @override
  void initState() {
    super.initState();
    userController.addListener(listenerUser);

    listenerUser();

    Future.delayed(const Duration(milliseconds: 600), () {
      Routefly.navigate(routePaths.home);
    });
  }

  void listenerUser() {
    if (userController.state case SuccessState(:final data)) {
      setState(() {
        user = data as UserEntity;
      });
    }
  }

  @override
  void dispose() {
    userController.removeListener(listenerUser);
    userController.dispose();
    super.dispose();
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
