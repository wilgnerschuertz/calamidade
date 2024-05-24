import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CardRequestStatus extends StatelessWidget {
  final String title;
  final String name;
  final String description;
  final String date;
  final String amount;
  final String city;
  final RequestStatusEntity type;

  const CardRequestStatus(
      {super.key,
      required this.title,
      required this.name,
      required this.description,
      required this.date,
      required this.amount,
      required this.city,
      required this.type});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: colors.borderColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                    color: colors.textColor, fontWeight: FontWeight.w700),
              ),
              Container(
                  decoration: BoxDecoration(
                    color: Color(type.color).withOpacity(0.13),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Color(type.color)),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  child: Text(
                    type.label,
                    style: textTheme.labelMedium?.copyWith(
                        color: Color(type.color), fontWeight: FontWeight.w500),
                  )),
            ],
          ),
          Text(name,
              style: textTheme.titleMedium?.copyWith(
                  color: colors.textColor, fontWeight: FontWeight.w500)),
          Text(city,
              style: textTheme.headlineMedium?.copyWith(
                  color: colors.textColor3,
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 8),
          Text(description,
              style: textTheme.headlineMedium?.copyWith(
                  color: colors.textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(UIcons.regularRounded.clock,
                      size: 16, color: colors.textColor3),
                  const SizedBox(width: 8),
                  Text(
                    date,
                    style: textTheme.displayMedium?.copyWith(
                        color: colors.textColor3,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              Text(
                amount,
                style: textTheme.displayMedium?.copyWith(
                    color: colors.textColor, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CooButton.outline(
            label: 'Ver detalhes',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
