import 'package:core_module/core_module.dart';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
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
          const Expanded(
            flex: 8,
            child: RouterOutlet(),
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
