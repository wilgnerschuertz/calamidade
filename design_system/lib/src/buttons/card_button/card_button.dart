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
        elevation: 0,
        color: CoopartilharColors.of(context).lightGrey,
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              icon,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      labelPrimary,
                      style: TextStyle(fontSize: 18, color: CoopartilharColors.of(context).textColor),
                    ),
                    Text(
                      labelSecondary,
                      style: TextStyle(fontSize: 12, color: CoopartilharColors.of(context).middleGrey),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
