import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {

  const RegisterPage({ super.key });

   @override
   Widget build(BuildContext context) {
        return Scaffold(
      appBar: AppBar(
        title: const Text('RegisterPage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: const Text('HomePage')),
          ),
        ],
      ),
    );
  }
}