import 'package:flutter/services.dart';

class CpfCnpjInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Remove qualquer caractere não numérico
    var text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    if (text.length <= 11) {
      // CPF: 000.000.000-00
      for (int i = 0; i < text.length && i < 11; i++) {
        if (i == 3 || i == 6) buffer.write('.');
        if (i == 9) buffer.write('-');
        buffer.write(text[i]);
      }
    } else {
      // CNPJ: 00.000.000/0000-00
      for (int i = 0; i < text.length && i < 14; i++) {
        if (i == 2 || i == 5) buffer.write('.');
        if (i == 8) buffer.write('/');
        if (i == 12) buffer.write('-');
        buffer.write(text[i]);
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}

class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final buffer = StringBuffer();

    if (text.isNotEmpty) buffer.write('(');
    for (int i = 0; i < text.length; i++) {
      if (i == 2) buffer.write(') ');
      if (i == 7) buffer.write('-');
      buffer.write(text[i]);
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.length),
    );
  }
}
