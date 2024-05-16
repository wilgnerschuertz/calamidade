import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardSituation extends StatelessWidget {
  const RequestDetailsCardSituation({
    super.key,
    required this.statusDetails,
  });

  final StatusDetailsEntity statusDetails;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThems = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                'Situação',
                style: textThems.displayMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: colors.textColor,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SituationPriorityTag(status: statusDetails.status)
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          statusDetails.description,
          style: textThems.bodySmall?.copyWith(
            fontSize: 14.0,
            color: colors.textColor,
          ),
        ),
      ],
    );
  }
}

class SituationPriorityTag extends StatelessWidget {
  const SituationPriorityTag({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    if (status == Status.high) {
      return PriorityTag.critical(label: status.label);
    } else if (status == Status.medium) {
      return PriorityTag.urgent(label: status.label);
    } else {
      return PriorityTag.routine(label: status.label);
    }
  }
}
