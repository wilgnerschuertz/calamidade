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
                CooButton(label: 'Entrar', onPressed: () {}),
                CooButtonIcon(label: 'Entrar com Icone', onPressed: () {}, icon: const Icon(Icons.arrow_right_alt, color: Colors.white,),),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/auth/register');
                  },
                  child: const Text('ResgisterPage'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
