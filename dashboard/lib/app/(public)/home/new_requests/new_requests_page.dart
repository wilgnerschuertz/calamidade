import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NewRequestsPage extends StatelessWidget {
  const NewRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      backgroundColor: colors.borderColor,
      body: const Center(
        child: Text('New Requests'),
      ),
    );
  }
}
