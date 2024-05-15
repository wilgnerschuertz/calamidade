import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class ChipButton extends StatefulWidget {
  const ChipButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onTapIcon,
  });

  final String label;
  final IconData icon;
  final VoidCallback? onTapIcon;

  @override
  State<ChipButton> createState() => _ChipButtonState();
}

class _ChipButtonState extends State<ChipButton> {
  late CoopartilharColors _colors;

  bool get _enabled => widget.onTapIcon != null;

  Color get _labelColor => _enabled ? _colors.white : _colors.textColor;

  Color get _iconColor => _enabled ? _colors.white : _colors.textColor;

  Color? get _backgroundCollor => _enabled ? _colors.primary : null;

  Border? get _border => _enabled ? null : Border.all(color: _colors.textColor);

  @override
  Widget build(BuildContext context) {
    _colors = CoopartilharColors.of(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          border: _border,
          color: _backgroundCollor),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.w600,
                color: _labelColor,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          GestureDetector(
            onTap: widget.onTapIcon,
            child: Icon(
              widget.icon,
              color: _iconColor,
              size: 16.0,
            ),
          )
        ],
      ),
    );
  }
}
