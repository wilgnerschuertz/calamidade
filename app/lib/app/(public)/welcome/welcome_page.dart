import 'package:coopartilhar/app/features/auth/interactor/controllers/login_controller_impl.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: recuperar informação do cache em um controller.
    final name = 'cooperado';

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
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
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
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
