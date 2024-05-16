import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsPageHeader extends StatelessWidget {
  const RequestDetailsPageHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThemes = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      child: Column(
        children: [
          Icon(
            UIcons.regularRounded.document_signed,
            size: 46.0,
            color: colors.primary,
          ),
          const SizedBox(height: 32.0),
          Text(
            title,
            style: textThemes.displayLarge?.copyWith(color: colors.textColor),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
