import 'package:core_module/core_module.dart';

class OnboardingEntity extends Entity {
  final double totalAmount;
  final double totalCooPartilhados;
  final double totalAssistedPeople;
  final double partnerDonations;

  OnboardingEntity(
    super.id, {
    required this.totalAmount,
    required this.totalCooPartilhados,
    required this.totalAssistedPeople,
    required this.partnerDonations,
  });
}
