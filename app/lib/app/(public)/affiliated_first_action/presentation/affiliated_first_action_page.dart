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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/splash/logo_splash.png')),
          const Text('Bem-vindo'),
          const Text('Vamos prosseguir. O que você deseja fazer?'),
          ChipButton(
            label: '', 
            icon: IconData(1),
            onTapIcon: () {  },
          ),
          ChipButton(
            label: '', 
            icon: IconData(1),
            onTapIcon: () {  },
          ),
        ],
      ),
    );
  }
}