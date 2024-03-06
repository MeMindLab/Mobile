import 'package:flutter/services.dart';

class PhoneNumberFormatter extends TextInputFormatter {
  PhoneNumberFormatter();

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text.length > 13)
      return TextEditingValue(
        text: oldValue.text.toString(),
        selection: TextSelection.collapsed(offset: oldValue.text.length),
      );

    if (oldValue.text.length > newValue.text.length) {
      return TextEditingValue(
        text: newValue.text.toString(),
        selection: TextSelection.collapsed(offset: newValue.text.length),
      );
    }

    String newText = newValue.text;
    if (newText.length > 3 && newText.substring(3, 4) != '-')
      newText = newText.substring(0, 3) + "-" + newText.substring(3);

    if (newText.length > 8 && newText.substring(8, 9) != '-')
      newText = newText.substring(0, 3) +
          "-" +
          newText.substring(4, 8) +
          "-" +
          newText.substring(8);

    return TextEditingValue(
      text: newText.toString(),
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
