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
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        spacing: 8.0,
        runSpacing: 8.0,
        direction: Axis.horizontal,
        verticalDirection: VerticalDirection.up,
        children: [
          Text(
            title,
            style: textThemes.displayMedium?.copyWith(
              fontWeight: FontWeight.w700,
              color: colors.textColor,
            ),
          ),
          Tag(
            label: CurrencyAdapter.doubleToBRL(price),
            labelColor: const Color(0xff1e8361), //TODO atualizar cores
            backgroundColor: const Color(0xff129166).withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}
