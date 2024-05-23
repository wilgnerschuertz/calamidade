import 'package:design_system/design_system.dart';
import 'package:design_system/src/menu/menu_archor.dart';
import 'package:flutter/material.dart';

class CardAddress extends StatelessWidget {
  final bool isSelected;
  final String addressName, street, complement, number, city;
  final VoidCallback onTap;
  final VoidCallback onTapRemove;
  final VoidCallback onTapEdit;

  const CardAddress({
    super.key,
    required this.addressName,
    required this.street,
    required this.complement,
    required this.number,
    required this.city,
    required this.onTap,
    this.isSelected = false,
    required this.onTapRemove,
    required this.onTapEdit,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: colors.lightGrey.withOpacity(0.4),
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: colors.otherGreen) : null,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  addressName,
                  style: texts.displayLarge,
                ),
                CooMenuArchorWidget(menus: [
                  MenuItemButton(
                    onPressed: onTapEdit,
                    leadingIcon: Icon(UIcons.boldStraight.pencil),
                    child: Text(
                      'Editar',
                      style: texts.labelMedium,
                    ),
                  ),
                  MenuItemButton(
                    onPressed: onTapRemove,
                    leadingIcon: Icon(UIcons.boldStraight.trash),
                    child: Text(
                      'Remover',
                      style: texts.labelMedium,
                    ),
                  ),
                ])
              ],
            ),
            const SizedBox(height: 8),
            Text(street, style: texts.displayMedium),
            Text(
              city,
              style: texts.bodySmall?.copyWith(color: colors.textColor2),
            ),
            const SizedBox(height: 8),
            Text(
              complement,
              style: texts.bodySmall?.copyWith(color: colors.textColor2),
            ),
          ],
        ),
      ),
    );
  }
}
