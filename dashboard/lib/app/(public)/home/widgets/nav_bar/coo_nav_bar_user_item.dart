import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooNavBarUserItem extends StatelessWidget {
  final bool isEmpty;
  final String name;
  final String role;
  final VoidCallback onPressed;

  const CooNavBarUserItem({
    super.key,
    required this.isEmpty,
    required this.name,
    required this.role,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () => onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        child: Row(
          children: [
            SizedBox(
              width: 36,
              height: 36,
              child: CircleAvatar(
                backgroundColor: colors.grey,
                child: isEmpty
                    ? Icon(
                        UIcons.regularStraight.user,
                        size: 25,
                        color: colors.white,
                      )
                    : const Image(image: CooImages.cooNoCoop),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: textTheme.labelMedium),
                const SizedBox(height: 2),
                Text(
                  role,
                  style:
                      textTheme.labelSmall?.copyWith(color: colors.textColor2),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
