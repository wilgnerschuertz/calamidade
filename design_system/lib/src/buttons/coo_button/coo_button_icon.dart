import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CooButtonIcon extends StatelessWidget {
  final Color? backgroundColor;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? textColor;
  final String label;
  final bool enable;
  final Icon icon;

  const CooButtonIcon({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
    this.enable = true,
    this.backgroundColor,
    this.isLoading = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? colors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: const Size.fromHeight(44),
          maximumSize: const Size.fromHeight(50),
          elevation: 0,
        ),
        onPressed: onPressed,
        // icon: icon,
        // iconAlignment: IconAlignment.end,
        child: isLoading
            ? const CircularProgressIndicator()
            : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: textColor ?? colors.white,
                    ),
                  ),
                  const Spacer(),
                  icon
              ],
            ),
      ),
    );
  }
}
