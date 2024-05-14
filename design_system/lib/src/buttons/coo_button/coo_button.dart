import 'package:flutter/material.dart';

class CooButton extends StatelessWidget {
  final Color buttonColor;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color textColor;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const CooButton({
    super.key,
    required this.buttonColor,
    required this.isLoading,
    required this.onPressed,
    required this.textColor,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        minimumSize: const Size.fromHeight(50),
        maximumSize: const Size.fromHeight(50),
        padding: const EdgeInsets.all(10),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            ),
    );
  }
}
