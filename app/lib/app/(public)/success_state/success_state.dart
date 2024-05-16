import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SuccessState extends StatelessWidget {
  const SuccessState({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Stack(        
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/pngs/background_details.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: size.height * 0.8,
                width: size.width * 0.6,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.asset('assets/lotties/successAnimation.json',repeat: false),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Parabéns!', style: textTheme.displayLarge),
                    ),
                    Text('Você acaba de se tornar um Padrinho.', style: textTheme.bodySmall?.copyWith(overflow: TextOverflow.clip),textAlign: TextAlign.center),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CooButton(
                  label: 'Continuar', 
                  onPressed: () {},
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
