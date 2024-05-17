import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    final titleStyle = Theme.of(context).textTheme.displayLarge?.copyWith(color: colors.primary, fontSize: 36, fontWeight: FontWeight.bold);

    final subTitleStyle = Theme.of(context).textTheme.displaySmall?.copyWith(color: colors.textColor, fontSize: 20);

    return Material(
      child: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            const Image(image: CooImages.cooBackgroundDetails),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  const Image(
                    image: CooImages.cooBrand1,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('R\$ 1,2 Milhão', style: Theme.of(context).textTheme.displayLarge?.copyWith(fontSize: 56, color: colors.primary, fontWeight: FontWeight.w700)),
                  Text('arrecadados', style: subTitleStyle),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('R\$1 Milhão', style: titleStyle),
                  Text(
                    'CooPartilhados',
                    style: subTitleStyle,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('1.024', style: titleStyle),
                  Text(
                    'pessoas assistidas',
                    style: subTitleStyle,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Text('R\$200.024', style: titleStyle),
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
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
