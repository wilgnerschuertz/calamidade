import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RequestDetailsCard extends StatelessWidget {
  const RequestDetailsCard({super.key, required this.request});

  final RequestDetailsEntity request;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: const Color(0xfff2f2f9).withOpacity(0.4),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RequestHeader(title: request.title, price: request.price),
          const SizedBox(height: 24.0),
          UserDetails(user: request.user),
          const SizedBox(height: 16.0),
          CreatedAtDate(createdAt: request.createdAt),
          const SizedBox(height: 40.0),
          StatusDetails(statusDetails: request.status),
        ],
      ),
    );
  }
}

class RequestHeader extends StatelessWidget {
  const RequestHeader({
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
            label:
                'R\$ ${price.toString()}', //TODO: formatar para valor monetário
            labelColor: const Color(0xff1e8361), //TODO atualizar cores
            backgroundColor: const Color(0xff129166).withOpacity(0.1),
          ),
        ],
      ),
    );
  }
}

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThemes = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'João Maria da silva',
          style: textThemes.headlineMedium
              ?.copyWith(fontWeight: FontWeight.w500, color: colors.textColor),
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
              'Estância Velha', //TODO: adicionar o endereço
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
              '+55 (51) 9 1234-5648', //TODO: adicionar telefone
              style: textThemes.bodySmall
                  ?.copyWith(fontSize: 14.0, color: colors.textColor),
            ),
          ],
        ),
      ],
    );
  }
}

class CreatedAtDate extends StatelessWidget {
  const CreatedAtDate({
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
        Text(
          DateAdapter.dateToString(createdAt),
          style: textThemes.bodySmall?.copyWith(
            fontSize: 14.0,
            color: const Color(0xff767373), //TODO: atualizar com a cor correta
          ),
        ),
      ],
    );
  }
}

class StatusDetails extends StatelessWidget {
  const StatusDetails({
    super.key,
    required this.statusDetails,
  });

  final StatusDetailsEntity statusDetails;

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textThems = Theme.of(context).textTheme;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Situação',
              style: textThems.displayMedium?.copyWith(
                fontWeight: FontWeight.w700,
                color: colors.textColor,
              ),
            ),
            StatusTag(status: statusDetails.status)
          ],
        ),
        const SizedBox(height: 8.0),
        Text(
          statusDetails.description,
          style: textThems.bodySmall?.copyWith(
            fontSize: 14.0,
            color: colors.textColor,
          ),
        ),
      ],
    );
  }
}

class StatusTag extends StatelessWidget {
  const StatusTag({super.key, required this.status});

  final Status status;

  @override
  Widget build(BuildContext context) {
    if (status == Status.high) {
      return PriorityTag.critical(label: status.label);
    } else if (status == Status.medium) {
      return PriorityTag.urgent(label: status.label);
    } else {
      return PriorityTag.routine(label: status.label);
    }
  }
}
