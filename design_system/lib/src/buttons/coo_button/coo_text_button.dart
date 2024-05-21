import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final Color? textColor;
  final String label;
  final bool enable;
  final IconData? icon;
  final EdgeInsets? padding;

  const CooTextButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
    this.enable = true,
    this.backgroundColor,
    this.icon,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;
    final labelColor = textColor ?? colors.primary;

    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 10, left: 10),
      child: TextButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon != null && label.isNotEmpty
                ? const SizedBox(width: 8)
                : Container(),
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(color: labelColor),
            ),
            Center(
              child: icon != null
                  ? Icon(
                      icon,
                      color: labelColor,
                    )
                  : Container(),
            ),
          ],
        ),
      ),
    );
  }
}
