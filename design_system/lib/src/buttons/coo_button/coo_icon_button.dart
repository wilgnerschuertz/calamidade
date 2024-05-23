import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooIconButton extends StatefulWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool isLoading;

  const CooIconButton(
      {super.key, required this.icon, this.onTap, this.isLoading = false});

  @override
  State<CooIconButton> createState() => _CooIconButtonState();
}

class _CooIconButtonState extends State<CooIconButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      icon: widget.isLoading
          ? SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  CoopartilharColors.of(context).white,
                ),
              ),
            )
          : Icon(
              widget.icon,
              color: CoopartilharColors.of(context).white,
            ),
      padding: const EdgeInsets.all(16),
      onPressed: widget.onTap,
    );
  }
}
