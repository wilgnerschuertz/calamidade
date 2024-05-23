import 'package:flutter/services.dart';

class ZipCodeInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 8) {
      text = text.substring(0, 8);
    }
    if (text.length > 5) {
      text = '${text.substring(0, 5)}-${text.substring(5)}';
    }
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
