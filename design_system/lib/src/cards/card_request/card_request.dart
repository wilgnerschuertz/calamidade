import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardRequest extends StatelessWidget {
  final double value;
  final String title, helpedName, localName;
  final DateTime dateTime;
  final VoidCallback onClickArrowRight;

  const CardRequest({
    super.key,
    required this.value,
    required this.title,
    required this.helpedName,
    required this.localName,
    required this.dateTime,
    required this.onClickArrowRight,
  });

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.lightGrey.withOpacity(0.4),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.middleGrey),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              decoration: BoxDecoration(
                color: colors.primary.withOpacity(.1),
                borderRadius: BorderRadius.circular(28),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  'R\$ $value',
                  style: TextStyle(
                    color: colors.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            trailing: IconButton(
              onPressed: onClickArrowRight,
              icon: Icon(UIcons.regularStraight.arrow_small_right, size: 30),
            ),
          ),
          const SizedBox(height: 16),
          Text(title, style: texts.displayMedium),
          const SizedBox(height: 8),
          Text(
            'Bairro: $localName',
            style: texts.bodySmall?.copyWith(color: colors.textColor2),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            height: 1,
            color: colors.grey,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    UIcons.regularStraight.clock_seven,
                    color: colors.textColor2,
                  ),
                  const SizedBox(width: 6),
                  Text(DateAdapter.dateAndHour(dateTime),
                      style:
                          texts.bodySmall?.copyWith(color: colors.textColor2)),
                ],
              ),
              const Spacer(),
              Expanded(
                child: Text(
                  'Por: $helpedName',
                  overflow: TextOverflow.ellipsis,
                  style: texts.bodySmall?.copyWith(color: colors.textColor2),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
