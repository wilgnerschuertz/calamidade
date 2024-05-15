import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/auth/login');
                },
                child: const Text('Login')),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/auth/not_affiliated');
              },
              child: const Text(
                'Página não cooperado',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
