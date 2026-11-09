import 'package:flutter/services.dart';

/// Keeps only digits (max 9) and groups them as `5##-##-##-##` while typing.
class MobileNumberFormatter extends TextInputFormatter {
  const MobileNumberFormatter();

  static const maxDigits = 9;
  static const _dashBefore = {3, 5, 7};

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var digits = newValue.text.replaceAll(RegExp(r'\D'), '');
    if (digits.length > maxDigits) digits = digits.substring(0, maxDigits);

    final buffer = StringBuffer();
    for (var i = 0; i < digits.length; i++) {
      if (_dashBefore.contains(i)) buffer.write('-');
      buffer.write(digits[i]);
    }

    final text = buffer.toString();
    return TextEditingValue(
      text: text,
      selection: TextSelection.collapsed(offset: text.length),
    );
  }
}
