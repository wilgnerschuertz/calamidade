import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardCreatedAtDate extends StatelessWidget {
  const RequestDetailsCardCreatedAtDate({
    super.key,
    required this.createdAt,
  });

  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    final colors = CoopartilharColors.of(context);
    return Row(
      children: [
        Icon(
          UIcons.regularRounded.clock,
          size: 16.0,
          color: colors.middleGrey,
        ),
        const SizedBox(width: 10.0),
        Flexible(
          child: Text(
            DateAdapter.dateToString(createdAt).toLowerCase(),
            style: textThemes.bodySmall?.copyWith(
              fontSize: 14.0,
              color: colors.middleGrey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
