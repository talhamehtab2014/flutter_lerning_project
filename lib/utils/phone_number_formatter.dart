import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;
    if (newText.length > 4) {
      newText = newText.substring(0, 4) + ' ' + newText.substring(4);
    }
    if (newText.length > 9) {
      newText = newText.substring(0, 9) + ' ' + newText.substring(9);
    }
    return TextEditingValue(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
