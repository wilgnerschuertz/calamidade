import 'package:core_module/core_module.dart';
import 'package:dashboard/app/(public)/home/widgets/nav_bar/coo_nav_bar.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final texts = Theme.of(context).textTheme;

    return Scaffold(
      body: Row(
        children: [
          const Expanded(
            flex: 2,
            child: CooNavBar(),
          ),
          const Expanded(
            flex: 8,
            child: RouterOutlet(),
          ),
          // TODO - Separar em um componente e criar a tela com as informações ao clicar em um card
          Expanded(
            flex: 2,
            child: Container(
              color: colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Image(
                            image: CooImages.cooBanricoop,
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Icon(
                            CooIcons.plusSmall,
                            color: colors.primary,
                            size: MediaQuery.sizeOf(context).width * 0.01,
                          ),
                        ),
                        Expanded(
                          child: Image(
                            image: CooImages.cooBrand1,
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'R\$ 1,2 Milhão',
                          style: texts.headlineLarge?.copyWith(
                            color: colors.primary,
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          'arrecadados',
                          style: texts.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'R\$ 1 Milhão',
                          style: texts.headlineLarge?.copyWith(
                            color: colors.primary,
                          ),
                        ),
                        Text(
                          'CooPartilhados',
                          style: texts.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '1.024',
                          style: texts.headlineLarge?.copyWith(
                            color: colors.primary,
                          ),
                        ),
                        Text(
                          'pessoas assistidas',
                          style: texts.bodySmall,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'R\$ 200.024',
                          style: texts.headlineLarge?.copyWith(
                            color: colors.primary,
                          ),
                        ),
                        Text(
                          'em doações de parceiros',
                          style: texts.bodySmall,
                        ),
                      ],
                    ),
                    Image(
                      image: CooImages.cooFlutterando1,
                      width: MediaQuery.sizeOf(context).width * 0.4,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
