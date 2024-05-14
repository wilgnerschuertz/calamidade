import 'package:core_module/core_module.dart';
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
    final colors = CoopartilharColors.of(context);

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
                CooButton(
                  label: 'Main Button',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton.icon(
                  icon: Icons.arrow_right_alt_sharp,
                  label: 'Main Button Icon',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton(
                  backgroundColor: colors.black,
                  label: 'Secondary Button',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton(
                  backgroundColor: colors.error,
                  label: 'Danger Button',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton(
                  backgroundColor: colors.grey,
                  label: 'Disabled Button',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton.outline(
                  label: 'Main Button Outline ',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
                CooButton.outline(
                  icon: Icons.arrow_right_alt_sharp,
                  label: 'Main Button Outline Icon',
                  onPressed: () {
                    Routefly.navigate('/auth/login');
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
