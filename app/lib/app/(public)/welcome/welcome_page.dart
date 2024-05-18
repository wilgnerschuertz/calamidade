import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    /// TODO: recuperar informação do cache em um controller.
    const name = 'cooperado';

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
                    children: [
                      TextSpan(text: 'Olá, '),
                      TextSpan(
                        text: '$name!',
                        style: TextStyle(color: Colors.green),
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
