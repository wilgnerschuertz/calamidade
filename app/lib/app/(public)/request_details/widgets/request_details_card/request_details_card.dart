import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_created_at_date.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_header.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_situation.dart';
import 'package:coopartilhar/app/(public)/request_details/widgets/request_details_card/request_details_card_user_details.dart';
import 'package:core_module/core_module.dart';
import 'package:flutter/material.dart';

class RequestDetailsCard extends StatelessWidget {
  const RequestDetailsCard({super.key, required this.request});

  final RequestEntity request;

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
          RequestDetailsCardHeader(
            title: request.title,
            price: request.amount,
          ),
          const SizedBox(height: 24.0),
          RequestDetailsCardUserDetails(
            user: request.user,

            /// TODO: add o endereço aqui
            city: 'endereço aqui...',
            phoneNumber: request.user.phone,
          ),
          const SizedBox(height: 16.0),
          RequestDetailsCardCreatedAtDate(createdAt: request.createdAt),
          const SizedBox(height: 40.0),
          RequestDetailsCardSituation(
            statusDetails: request.status,
            description: request.description,
          ),
        ],
      ),
    );
  }
}
