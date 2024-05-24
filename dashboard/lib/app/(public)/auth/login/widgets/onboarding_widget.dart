import 'package:flutter/material.dart';
import 'package:design_system/design_system.dart';

class OnboardingWidget extends StatefulWidget {
  const OnboardingWidget({super.key});

  @override
  State<OnboardingWidget> createState() => _OnboardingWidgetState();
}

class _OnboardingWidgetState extends State<OnboardingWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
        ],
      ),
    );
  }
}
