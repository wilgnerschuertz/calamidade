import 'package:coopartilhar/app/features/onboarding/interactor/controllers/onboarding_controller.dart';
import 'package:coopartilhar/app/features/onboarding/interactor/state/onboarding_state.dart';
import 'package:coopartilhar/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = injector.get<OnboardingController>();

  @override
  void initState() {
    super.initState();
    controller.getOnboardingData();
    controller.addListener(listener);
  }

  void listener() {
    if (controller.value case ErrorState(:final exception)) {
      Alerts.showFailure(context, exception.message);
    }
  }

  @override
  void dispose() {
    controller.removeListener(listener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(
        color: colors.primary, fontSize: 36, fontWeight: FontWeight.bold);
    final subTitleStyle = Theme.of(context)
        .textTheme
        .displayMedium
        ?.copyWith(color: colors.textColor, fontSize: 20);

    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, state, _) {
            return switch (state) {
              OnboardingSuccessState() => SafeArea(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      const Image(image: CooImages.cooBackgroundDetails),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 48),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const Spacer(),
                            const Image(image: CooImages.cooBrand1),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                                CurrencyAdapter.doubleToBRL(
                                    state.data.donationsAmount),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                        fontSize: 56,
                                        color: colors.primary,
                                        fontWeight: FontWeight.w700)),
                            Text('arrecadados', style: subTitleStyle),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                                CurrencyAdapter.doubleToBRL(
                                    state.data.cooPartilhados),
                                style: titleStyle),
                            Text(
                              'CooPartilhados',
                              style: subTitleStyle,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(state.data.assistedPeople.toString(),
                                style: titleStyle),
                            Text(
                              'pessoas assistidas',
                              style: subTitleStyle,
                            ),
                            const SizedBox(
                              height: 32,
                            ),
                            Text(
                                CurrencyAdapter.doubleToBRL(
                                    state.data.partnerDonations),
                                style: titleStyle),
                            Text(
                              'em doações de parceiros',
                              style: subTitleStyle,
                            ),
                            const Spacer(),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: CooButton.primary(
                                  label: 'Começar',
                                  onPressed: () {},
                                  icon: UIcons.regularStraight.arrow_right,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              OnboardingErrorState() => const SizedBox.shrink(),
              _ => const Center(child: CircularProgressIndicator()),
            };
          }),
    );
  }
}
