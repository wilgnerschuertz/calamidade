import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum Priority { critical, urgent, routine }

class PriorityTag extends StatefulWidget {
  const PriorityTag._({super.key, required this.label, required this.priority});

  final String label;
  final Priority priority;

  factory PriorityTag.critical({Key? key, required String label}) {
    return PriorityTag._(key: key, label: label, priority: Priority.critical);
  }
  factory PriorityTag.urgent({Key? key, required String label}) {
    return PriorityTag._(key: key, label: label, priority: Priority.urgent);
  }

  factory PriorityTag.routine({Key? key, required String label}) {
    return PriorityTag._(key: key, label: label, priority: Priority.routine);
  }

  @override
  State<PriorityTag> createState() => _PriorityTagState();
}

class _PriorityTagState extends State<PriorityTag> {
  late Color _backgroundColor;
  late Color _foregroundColor;

  late CoopartilharColors colors;
  late TextTheme textThemes;

  void _setTagColorsByPriority(Priority priority) {
    if (priority == Priority.critical) {
      _backgroundColor = colors.criticalLight;
      _foregroundColor = colors.critical;
    } else if (priority == Priority.urgent) {
      _backgroundColor = colors.urgentLight;
      _foregroundColor = colors.urgent;
    } else {
      _backgroundColor = colors.routineLight;
      _foregroundColor = colors.routine;
    }
  }

  @override
  Widget build(BuildContext context) {
    colors = CoopartilharColors.of(context);
    textThemes = Theme.of(context).textTheme;
    _setTagColorsByPriority(widget.priority);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: _foregroundColor),
        color: _backgroundColor,
      ),
      child: Text(
        widget.label,
        style: textThemes.labelMedium?.copyWith(color: _foregroundColor),
      ),
    );
  }
}
