import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'package:dashboard/app/(public)/home/widgets/nav_bar/nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    return Row(
      children: [
        const SizedBox(
          width: 300,
          child: NavBar(),
        ),
        Expanded(
          flex: 6,
          child: Container(
            color: colors.borderColor,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        )
      ],
    );
  }
}
