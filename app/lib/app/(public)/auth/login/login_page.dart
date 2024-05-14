import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginPage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          Center(
            child: Column(
              children: [
                CooButton.primary(
                  icon: Icons
                      .check, // Só adicionar o Icon, de regra fica no final =))
                  label: 'Main Button',
                  onPressed: () {},
                ),
                CooButton.secondary(
                  label: 'Secondary Button',
                  onPressed: () {},
                ),
                CooButton.danger(
                  icon: Icons
                      .close, // Só adicionar o Icon, de regra fica no final =))
                  label: 'Danger Button',
                  onPressed: () {},
                ),
                CooButton.outline(
                  label: 'Outline Button',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
