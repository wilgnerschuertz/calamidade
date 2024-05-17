import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: CooNavBar(),
          ),
          Expanded(
            flex: 8,
            child: Container(
              color: colors.borderColor,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
