import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;

  const CooIconButton({super.key, required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: Icon(
        icon,
        color: CoopartilharColors.of(context).white,
      ),
      padding: const EdgeInsets.all(16),
      onPressed: onTap,
    );
  }
}
