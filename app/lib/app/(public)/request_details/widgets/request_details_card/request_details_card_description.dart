import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardDescription extends StatelessWidget {
  const RequestDetailsCardDescription({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

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
          Text(
            'Descrição',
            style: textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 9.0),
          Text(
            description,
            style: textTheme.bodySmall?.copyWith(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
