import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class PriorityTag extends StatefulWidget {
  const PriorityTag({
    super.key,
    required this.label,
    required this.color,
    required this.foregroundColor,
  });

  final String label;
  final Color color;
  final Color foregroundColor;

  @override
  State<PriorityTag> createState() => _PriorityTagState();
}

class _PriorityTagState extends State<PriorityTag> {
  late CoopartilharColors colors;
  late TextTheme textThemes;

  @override
  Widget build(BuildContext context) {
    colors = CoopartilharColors.of(context);
    textThemes = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: widget.foregroundColor),
        color: widget.color,
      ),
      child: Text(
        widget.label,
        style: textThemes.labelMedium?.copyWith(color: widget.foregroundColor),
      ),
    );
  }
}
