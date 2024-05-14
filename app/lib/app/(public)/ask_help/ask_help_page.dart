import 'package:flutter/material.dart';

class AskHelpPage extends StatelessWidget {
  const AskHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('askHelpPage'),
      ),
      body: const Column(
        children: [
          Placeholder(),
          Text('list of help requests will be shown here.')
        ],
      ),
    );
  }
}
