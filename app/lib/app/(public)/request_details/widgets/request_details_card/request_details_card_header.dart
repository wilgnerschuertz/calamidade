import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardHeader extends StatelessWidget {
  const RequestDetailsCardHeader({
    super.key,
    required this.title,
    required this.price,
  });

  final String title;
  final double price;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThemes = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        verticalDirection: VerticalDirection.up,
        children: [
          Expanded(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: textThemes.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textColor,
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: colors.lightGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              CurrencyAdapter.doubleToBRL(price),
              style: textThemes.labelSmall?.copyWith(color: colors.primary),
            ),
          ),
        ],
      ),
    );
  }
}
