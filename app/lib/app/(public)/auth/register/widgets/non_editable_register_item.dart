import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NonEditableRegisterItem extends StatelessWidget {
  const NonEditableRegisterItem({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = CoopartilharColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: textTheme.titleMedium?.copyWith(color: colors.textColor),
        ),
        const SizedBox(height: 15),
        Text(
          value,
          style: textTheme.bodySmall
              ?.copyWith(fontSize: 20, color: colors.textColor),
        ),
      ],
    );
  }
}
