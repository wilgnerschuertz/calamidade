import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class DeniedRequestsPage extends StatefulWidget {
  const DeniedRequestsPage({super.key});

  @override
  State<DeniedRequestsPage> createState() => _DeniedRequestsPageState();
}

class _DeniedRequestsPageState extends State<DeniedRequestsPage> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      backgroundColor: colors.borderColor,
      body: const Center(
        child: Text('DeniedRequests'),
      ),
    );
  }
}
