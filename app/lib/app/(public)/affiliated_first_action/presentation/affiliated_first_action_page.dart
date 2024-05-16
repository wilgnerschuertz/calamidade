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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(child: Image.asset('assets/splash/logo_splash.png')),
              const SizedBox(
                height: 24,
              ),
              const Text(
                'Bem-vindo',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Vamos prosseguir. O que você deseja fazer?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Column(
                children: [
                  CardButton(
                    icon: Image.asset('assets/affiliated_first_action/need_help.png'),
                    labelPrimary: 'Preciso de ajuda',
                    labelSecondary: 'Estou buscando recursos',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CardButton(
                    icon: Image.asset('assets/affiliated_first_action/want_to_help.png'),
                    labelPrimary: 'Quero ajudar!',
                    labelSecondary: 'Quero apadrinhar uma família',
                    onPressed: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
