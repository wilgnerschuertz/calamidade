import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

enum StatusRequest {
  analisys('Em análise', 0xFFfcb900, 0xFFEB575),
  accepted('Aprovado', 0xFF129166, 0xFF0a4531),
  rejected('Recusado', 0xFFEB5757, 0xE94949),
  concluded('Concluído', 0xFF129166, 0xFF0a4531),
  notDefined('Não definido', 0xFF010101, 0xFFFFFFFF);

  final String label;
  final int color;
  final int foregroundColor;

  const StatusRequest(this.label, this.color, this.foregroundColor);

  static StatusRequest fromId(int id) {
    switch (id) {
      case 1:
        return StatusRequest.analisys;
      case 2:
        return StatusRequest.accepted;
      case 3:
        return StatusRequest.rejected;
      case 4:
        return StatusRequest.concluded;
      default:
        return StatusRequest.notDefined;
    }
  }
}

class StatusRequestTag extends StatefulWidget {
  const StatusRequestTag({super.key, required this.status});

  final StatusRequest status;

  @override
  State<StatusRequestTag> createState() => _StatusRequestTagState();
}

class _StatusRequestTagState extends State<StatusRequestTag> {
  late CoopartilharColors colors;
  late TextTheme textThemes;
  late Color color;
  late Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    colors = CoopartilharColors.of(context);
    textThemes = Theme.of(context).textTheme;
    switch (widget.status) {
      case StatusRequest.analisys:
        color = colors.urgentLight;
        foregroundColor = colors.urgent;
      case StatusRequest.accepted:
        color = colors.routineLight;
        foregroundColor = colors.routine;
      case StatusRequest.rejected:
        color = colors.criticalLight;
        foregroundColor = colors.critical;
      case StatusRequest.concluded:
        color = colors.routineLight;
        foregroundColor = colors.routine;
      case StatusRequest.notDefined:
        color = colors.black;
        foregroundColor = colors.white;
      default:
        color = colors.black;
        foregroundColor = colors.white;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
        border: Border.all(color: foregroundColor),
        color: color,
      ),
      child: Text(
        widget.status.label,
        style: textThemes.labelMedium?.copyWith(color: foregroundColor),
      ),
    );
  }
}
