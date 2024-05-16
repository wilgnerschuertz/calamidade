import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCardUserDetails extends StatelessWidget {
  const RequestDetailsCardUserDetails({
    super.key,
    required this.user,
    required this.city,
    required this.phoneNumber,
  });

  final UserEntity user;
  final String city;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThemes = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          user.name,
          style: textThemes.headlineMedium?.copyWith(
            fontWeight: FontWeight.w500,
            color: colors.textColor,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Cidade:',
              style: textThemes.bodySmall?.copyWith(
                  fontSize: 14.0,
                  color: const Color(0xff595959)), //TODO: atualizar cor
            ),
            Text(
              city,
              style: textThemes.bodySmall?.copyWith(
                  fontSize: 14.0,
                  color: const Color(0xff595959)), //TODO: atualizar cor
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Telefone: ',
              style: textThemes.bodySmall
                  ?.copyWith(fontSize: 14.0, color: colors.textColor),
            ),
            Text(
              phoneNumber,
              style: textThemes.bodySmall
                  ?.copyWith(fontSize: 14.0, color: colors.textColor),
            ),
          ],
        ),
      ],
    );
  }
}
