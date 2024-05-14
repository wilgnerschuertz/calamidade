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
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          CooButton(
            label: 'Login',
            onPressed: () {
              Routefly.navigate('/auth/login');
            },
          ),
        ],
      ),
    );
  }
}
