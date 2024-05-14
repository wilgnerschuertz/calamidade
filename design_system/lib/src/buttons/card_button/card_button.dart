import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  const CardButton({
    super.key,
    required this.icon,
    required this.labelPrimary,
    required this.labelSecondary,
    required this.onPressed,
  });

  final Widget icon;
  final String labelPrimary, labelSecondary;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                icon,
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        labelPrimary,
                        style: TextStyle(fontSize: 16, color: CoopartilharColors.of(context).black),
                      ),
                      Text(
                        labelSecondary,
                        style: TextStyle(fontSize: 12, color: CoopartilharColors.of(context).grey),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
