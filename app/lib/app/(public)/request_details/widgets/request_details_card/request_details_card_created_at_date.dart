import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardCreatedAtDate extends StatelessWidget {
  const RequestDetailsCardCreatedAtDate({
    super.key,
    required this.createdAt,
  });

  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    final textThemes = Theme.of(context).textTheme;
    return Row(
      children: [
        Icon(
          UIcons.regularRounded.clock,
          size: 16.0,
          color: const Color(0xff767373), //TODO: atualizar com a cor correta
        ),
        const SizedBox(width: 10.0),
        Flexible(
          child: Text(
            DateAdapter.dateToString(createdAt),
            style: textThemes.bodySmall?.copyWith(
              fontSize: 14.0,
              color:
                  const Color(0xff767373), //TODO: atualizar com a cor correta
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
