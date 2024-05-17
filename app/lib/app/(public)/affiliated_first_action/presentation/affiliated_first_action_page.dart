import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class AffiliatedFirstActionPage extends StatefulWidget {
  const AffiliatedFirstActionPage({super.key});

  @override
  State<AffiliatedFirstActionPage> createState() => _AffiliatedFirstActionPageState();
}

class _AffiliatedFirstActionPageState extends State<AffiliatedFirstActionPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const Image(image: CooImages.cooBackgroundDetails),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(image: CooImages.cooBrand1),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Bem-vindo',
                      style: TextStyle(fontSize: 28, color: CoopartilharColors.of(context).textColor),
                    ),
                  ),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 50), child: Text('Vamos prosseguir. O que você deseja fazer?', textAlign: TextAlign.center, style: textTheme.bodySmall!.copyWith(fontSize: 24, color: CoopartilharColors.of(context).textColor))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CardButton(
                      icon: Image.asset('assets/pngs/need_help.png'),
                      labelPrimary: 'Preciso de ajuda',
                      labelSecondary: 'Estou buscando recursos',
                      onPressed: () => Navigator.pushNamed(context, '/ask_help'),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CardButton(
                      icon: Image.asset('assets/pngs/want_to_help.png'),
                      labelPrimary: 'Quero ajudar!',
                      labelSecondary: 'Quero apadrinhar uma família',
                      onPressed: () => Navigator.pushNamed(context, '/want_to_help'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
