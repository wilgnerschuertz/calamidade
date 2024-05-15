import 'package:core_module/core_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class NotAfilliatedPage extends StatefulWidget {
  const NotAfilliatedPage({super.key});

  @override
  State<NotAfilliatedPage> createState() => _NotAfilliatedPageState();
}

class _NotAfilliatedPageState extends State<NotAfilliatedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SvgPicture.asset(
            'assets/svgs/background_details.svg',
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                SvgPicture.asset('assets/svgs/not_affiliated.svg'),
                const SizedBox(height: 32),
                Text(
                  'Você não é\num Cooperado!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    color: CoopartilharColors.of(context).primary,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Não podemos te ajudar no momento!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: CoopartilharColors.of(context).black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
