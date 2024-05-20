import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedPage extends StatelessWidget {
  const AffiliatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Spacer(),
              Image(
                  image: CooImages.cooSuccess,
                  width: MediaQuery.sizeOf(context).width * 0.8),
              const SizedBox(
                height: 32,
              ),
              Text(
                'Você é um cooperado!',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'inter',
                    color: colors.primary,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Prossiga para concluir seu cadastro',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                    color: colors.black),
              ),
              TextButton(
                onPressed: () {
                  Routefly.push(routePaths.auth.login);
                },
                child: Text(
                  'Já tenho cadastro',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'inter',
                    fontWeight: FontWeight.w400,
                    color: colors.primary,
                    decoration: TextDecoration.underline,
                    decorationColor: colors.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              CooButton.primary(
                label: 'Concluir cadastro',
                onPressed: () {
                  Routefly.push(routePaths.auth.register);
                },
                icon: Icons.arrow_right_alt,
              ),
              const Spacer(flex: 2),
            ],
          )
        ],
      ),
    );
  }
}
