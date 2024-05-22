import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  const Tag({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor,
  });

  final String label;
  final Color? labelColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: labelColor!),
        borderRadius: BorderRadius.circular(8.0),
        color: backgroundColor!.withOpacity(0.2),
      ),
      child: Text(
        label,
        style: textThemes.labelSmall?.copyWith(color: labelColor),
      ),
    );
  }
}
