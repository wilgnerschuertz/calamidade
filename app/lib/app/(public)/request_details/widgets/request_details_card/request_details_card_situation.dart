import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardSituation extends StatelessWidget {
  const RequestDetailsCardSituation(
      {super.key, required this.description, required this.status});

  final String description;
  final RequestStatusEntity status;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThems = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(12.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: colors.grey,
        ),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Situação',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textThems.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: colors.textColor,
                  ),
                ),
              ),
              Tag(
                label: status.label,
                labelColor: Color(status.color),
                backgroundColor: Color(status.foregroundColor),
              ),
            ],
          ),
          const SizedBox(height: 9.0),
          Text(
            description,
            style: textThems.bodySmall?.copyWith(
              fontSize: 14.0,
              color: colors.textColor,
            ),
          ),
        ],
      ),
    );
  }
}
