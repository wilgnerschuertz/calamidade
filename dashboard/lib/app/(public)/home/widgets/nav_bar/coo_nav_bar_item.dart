// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooNavBarItem extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Widget icon;
  final bool showNotifications;
  final int numberNotifications;
  final bool isSelected;

  const CooNavBarItem({
    super.key,
    required this.label,
    required this.onPressed,
    required this.icon,
    this.showNotifications = false,
    this.numberNotifications = 0,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        onPressed();
      },
      child: Container(
        color: isSelected
            ? const Color(0xFF129166).withOpacity(0.2)
            : colors.white,
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
                        style: textTheme.labelMedium
                            ?.copyWith(color: colors.white),
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
