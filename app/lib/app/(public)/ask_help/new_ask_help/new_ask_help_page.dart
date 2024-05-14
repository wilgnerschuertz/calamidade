import 'package:flutter/material.dart';

class NewAskHelpPage extends StatelessWidget {
  const NewAskHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NewAskHelpPage'),
      ),
      body: Column(
        children: [
          const Placeholder(),
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/ask_help');
              },
              child: const Text('AskHelpPage')),
        ],
      ),
    );
  }
}
