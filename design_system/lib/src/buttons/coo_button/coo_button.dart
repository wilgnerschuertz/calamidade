import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CooButton extends StatelessWidget {
  final Color buttonColor;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final bool enable;
  final Icon? icon;
  const CooButton({
    super.key,
    required this.buttonColor,
    required this.isLoading,
    required this.onPressed,
    required this.textColor,
    required this.text,
    required this.enable,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CoopartilharColorsExtension>()!;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: enable ? colors.success : colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size.fromHeight(50),
        maximumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.all(10),
        elevation: 0,
      ),
      onPressed: isLoading || !enable ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                  ),
                ),
                icon ?? Container(),
              ],
            ),
    );
  }
}
