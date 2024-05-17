import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ApprovedRequestsPage extends StatefulWidget {
  const ApprovedRequestsPage({super.key});

  @override
  State<ApprovedRequestsPage> createState() => _ApprovedRequestsState();
}

class _ApprovedRequestsState extends State<ApprovedRequestsPage> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      backgroundColor: colors.borderColor,
      body: const Center(
        child: Text('ApprovedRequests'),
      ),
    );
  }
}
