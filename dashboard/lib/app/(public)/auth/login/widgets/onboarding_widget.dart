import 'package:dashboard/app/features/auth/interactor/entities/onboarding_entity.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/injector.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:dashboard/app/features/auth/interactor/controllers/onboarding_controller.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  final OnboardingController controller = injector.get<OnboardingController>();

  @override
  void initState() {
    controller.getOnboardingData();
    controller.addListener(listener);
    super.initState();
  }

  void listener() {
    return switch (controller.value) {
      ErrorState(:final exception) =>
        Alerts.showFailure(context, exception.message),
      _ => null,
    };
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final titleStyle = Theme.of(context).textTheme.displayMedium?.copyWith(
        color: colors.primary, fontSize: 20, fontWeight: FontWeight.w500);
    final subTitleStyle = Theme.of(context)
        .textTheme
        .displaySmall
        ?.copyWith(color: colors.textColor, fontSize: 16);
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: CooImages.cooBackgroundDetails,
          alignment: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16), bottomLeft: Radius.circular(16)),
        color: Color(0xFFECECF6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: CooImages.cooBanricoop,
                width: 100,
              ),
              const SizedBox(width: 20),
              Text(
                '+',
                style: TextStyle(
                    fontSize: 35, color: Theme.of(context).primaryColor),
              ),
              const SizedBox(width: 20),
              const Image(
                image: CooImages.cooBrand1,
                width: 100,
              ),
            ],
          ),
          const SizedBox(
            height: 32,
          ),
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, state, child) {
              if (state is LoadingState) {
                return const CircularProgressIndicator();
              }

              if (state is SuccessState<OnboardingEntity>) {
                return Column(
                  children: [
                    Text(
                        CurrencyAdapter.doubleToBRL(state.data.donationsAmount),
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(fontSize: 36, color: colors.primary)),
                    Text('arrecadados', style: subTitleStyle),
                    const SizedBox(
                      height: 32,
                    ),
                    Text(CurrencyAdapter.doubleToBRL(100), style: titleStyle),
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
                  ],
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}
