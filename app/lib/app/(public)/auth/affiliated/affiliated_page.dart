import 'package:coopartilhar/routes.dart';
import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedPage extends StatelessWidget {
  const AffiliatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(UIcons.regularStraight.angle_small_left),
          onPressed: () {
            Routefly.pop(context);
          },
        ),
      ),
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
                style: textTheme.displayLarge?.copyWith(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: colors.primary),
              ),
              Text(
                'Prossiga para concluir seu cadastro',
                textAlign: TextAlign.center,
                style: textTheme.displaySmall?.copyWith(color: colors.black),
              ),
              TextButton(
                  onPressed: () {
                    Routefly.push(routePaths.auth.login.path);
                  },
                  child: Text(
                    'Já tenho cadastro',
                    style: textTheme.displayMedium?.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: colors.primary),
                  )),
              const Spacer(),
              CooButton.primary(
                  label: 'Concluir cadastro',
                  icon: UIcons.regularStraight.arrow_small_right,
                  onPressed: () {
                    Routefly.push(routePaths.auth.register);
                  }),
              const SizedBox(height: 10)
            ],
          )
        ],
      ),
    );
  }
}
