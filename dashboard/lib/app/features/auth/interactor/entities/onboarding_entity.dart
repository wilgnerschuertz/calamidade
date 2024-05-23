import 'package:core_module/core_module.dart';

class OnboardingEntity extends Entity {
  final double donationsAmount;
  final double cooPartilhados;
  final double assistedPeople;
  final double partnerDonations;

  OnboardingEntity(
    super.id, {
    required this.donationsAmount,
    required this.cooPartilhados,
    required this.assistedPeople,
    required this.partnerDonations,
  });
}
