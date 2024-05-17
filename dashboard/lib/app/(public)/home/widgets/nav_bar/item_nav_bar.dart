// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ItemNavBar extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget icon;
  final bool showNotifications;
  final int numberNotifications;

  const ItemNavBar({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.showNotifications = false,
    this.numberNotifications = 0,
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
            icon,
            const SizedBox(width: 8),
            Text(
              label,
              style: textTheme.bodyMedium?.copyWith(color: colors.textColor2),
            ),
            const SizedBox(width: 8),
            showNotifications
                ? CircleAvatar(
                    radius: 15,
                    backgroundColor: colors.error,
                    child: Text(
                      numberNotifications.toString(),
                      style:
                          textTheme.labelMedium?.copyWith(color: colors.white),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
