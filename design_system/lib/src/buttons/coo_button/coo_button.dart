import 'package:flutter/material.dart';

import '../../../design_system.dart';

class CooButton extends StatelessWidget {
  final Color? backgroundColor;
  final bool isLoading;
  final VoidCallback onPressed;
  final Color? textColor;
  final String label;
  final bool enable;
  final bool outline;
  final IconData? icon;

  const CooButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.textColor,
    this.enable = true,
    this.backgroundColor,
    this.isLoading = false,
    this.outline = false,
    this.icon,
  });

  factory CooButton.outline({
    required String label,
    required VoidCallback onPressed,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
    IconData? icon,
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      enable: enable,
      outline: true,
      icon: icon,
    );
  }

  factory CooButton.icon({
    required String label,
    required VoidCallback onPressed,
    required IconData icon,
    Color? textColor,
    Color? backgroundColor,
    bool isLoading = false,
    bool enable = true,
  }) {
    return CooButton(
      label: label,
      onPressed: onPressed,
      textColor: textColor,
      backgroundColor: backgroundColor,
      isLoading: isLoading,
      enable: enable,
      outline: false,
      icon: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    final colors = CoopartilharColors.of(context);

    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: outline
          ? OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                  color: backgroundColor ?? colors.primary,
                  width: 1.0,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onPressed: enable ? onPressed : null,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : _ContentButton(
                      icon: Icon(
                        icon,
                        color: textColor ?? colors.primary,
                      ),
                      label: label,
                      textColor: textColor ?? colors.primary,
                      colors: colors,
                    ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: backgroundColor ?? colors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 0,
              ),
              onPressed: enable ? onPressed : null,
              child: isLoading
                  ? const CircularProgressIndicator()
                  : _ContentButton(
                      icon: Icon(
                        icon,
                        color: textColor ?? colors.white,
                      ),
                      label: label,
                      textColor: textColor ?? colors.white,
                      colors: colors,
                    ),
            ),
    );
  }
}

class _ContentButton extends StatelessWidget {
  const _ContentButton({
    required this.icon,
    required this.label,
    required this.textColor,
    required this.colors,
  });

  final Icon? icon;
  final String label;
  final Color? textColor;
  final CoopartilharColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        icon != null
            ? const SizedBox(
                height: 10,
                width: 25,
              )
            : Container(),
        Text(
          label,
          style: TextStyle(
            color: textColor ?? colors.primary,
          ),
        ),
        icon ?? Container(),
      ],
    );
  }
}
