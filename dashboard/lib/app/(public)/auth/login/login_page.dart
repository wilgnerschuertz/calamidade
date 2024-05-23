import 'package:dashboard/app/(public)/auth/login/widgets/login_form_widget.dart';
import 'package:dashboard/app/(public)/auth/login/widgets/onboarding_widget.dart';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CoopartilharColors.of(context).lightGrey,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                constraints: const BoxConstraints(
                  maxWidth: 1024,
                  maxHeight: 504,
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: OnboardingWidget(),
                    ),
                    Expanded(
                      child: LoginFormWidget(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Produzido pela comunidade'),
                  Image(image: CooImages.cooFlutterando1, width: 220),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
