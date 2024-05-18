import 'package:coopartilhar/app/features/onboarding/interactor/entities/onboarding_entity.dart';

class OnboardingAdpter {
  OnboardingAdpter._();

  static OnboardingEntity fromJson(Map json) {
    // TODO, rever variaveis do backend
    return OnboardingEntity(
      json['id'],
      donationsAmount: json['donations_amount'],
      cooPartilhados: json['coopartilhados'],
      assistedPeople: json['assisted_people'],
      partnerDonations: json['partner_donations'],
    );
  }
}
