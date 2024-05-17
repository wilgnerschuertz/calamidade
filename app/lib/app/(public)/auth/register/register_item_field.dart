import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class RegisterItemField extends StatefulWidget {
  const RegisterItemField({
    super.key,
    required this.title,
    required this.controller,
    required this.hint,
    this.validator,
    this.isPassword = false,
  });

  final String title;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;

  @override
  State<RegisterItemField> createState() => _RegisterItemFieldState();
}

class _RegisterItemFieldState extends State<RegisterItemField> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = CoopartilharColors.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: textTheme.bodyMedium?.copyWith(height: 1.125, color: colors.textColor),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: !_passwordVisible,
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(_passwordVisible ? Icons.visibility_off : Icons.visibility),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator,
          style: textTheme.displaySmall?.copyWith(height: 0.9, color: colors.textColor),
        ),
      ],
    );
  }
}
