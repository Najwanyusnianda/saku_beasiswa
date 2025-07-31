import 'package:flutter/services.dart';

class IndonesianPhoneFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;

    if (text.isEmpty) {
      return newValue;
    }

    // Remove any existing formatting
    final digitsOnly = text.replaceAll(RegExp(r'[^\d]'), '');

    // Format: 0812-3456-7890
    String formatted = '';
    for (int i = 0; i < digitsOnly.length && i < 12; i++) {
      if (i == 4 || i == 8) {
        formatted += '-';
      }
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
