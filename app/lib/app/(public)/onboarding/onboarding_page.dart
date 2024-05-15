import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

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
      body: DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://static.vecteezy.com/ti/vetor-gratis/t1/7677104-fundo-branco-com-padrao-geometrico-azul-e-linha-branca-gratis-vetor.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/3/3e/Bras%C3%A3o_rio_grande_do_sul.png',
                        width: 200,
                        height: 158,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text('R\$ 1,2 Milhão',
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
                      Text('R\$1 Milhão', style: titleStyle),
                      Text(
                        'CooPartilhados',
                        style: subTitleStyle,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      Text('R\$1.024', style: titleStyle),
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
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 48),
                    child: Align(
                        alignment: Alignment.bottomCenter,
                        child: CooButton.primary(
                          label: 'Começar',
                          onPressed: () {},
                          icon: UIcons.regularStraight.arrow_right,
                        )),
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
