import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class CooInputButton extends StatelessWidget {
  final TextEditingController controller;
  final IconData iconData;
  final VoidCallback? onTap;

  const CooInputButton({
    super.key,
    required this.controller,
    required this.iconData,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: controller,
            readOnly: true,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        SizedBox(
            child: CooIconButton(
          icon: iconData,
          onTap: onTap,
        )),
      ],
    );
  }
}
