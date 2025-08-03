import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum FieldType { name, email, contact, number, password }

class CommonTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController? controller;
  final FieldType fieldType;
  final bool isReadOnly;
  final VoidCallback? onTap;

  const CommonTextField({
    super.key,
    required this.labelText,
    this.controller,
    required this.fieldType,
    this.isReadOnly = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Input formatters and keyboard type based on field type
    TextInputType keyboardType = TextInputType.text;
    List<TextInputFormatter> inputFormatters = [];
    bool obscureText = false;
    TextCapitalization capitalization = TextCapitalization.none;

    switch (fieldType) {
      case FieldType.name:
        capitalization = TextCapitalization.words;
        keyboardType = TextInputType.name;
        break;
      case FieldType.email:
        keyboardType = TextInputType.emailAddress;
        break;
      case FieldType.contact:
        keyboardType = TextInputType.phone;
        inputFormatters = [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(10),
        ];
        break;
      case FieldType.number:
        keyboardType = TextInputType.number;
        inputFormatters = [FilteringTextInputFormatter.digitsOnly];
        break;
      case FieldType.password:
        obscureText = true;
        break;
    }

    return SizedBox(
      height: 50,
      child: TextFormField(
        controller: controller,
        readOnly: isReadOnly,
        onTap: onTap,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        textCapitalization: capitalization,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 16,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) return 'Required';

          if (fieldType == FieldType.email &&
              !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}').hasMatch(value)) {
            return 'Enter a valid email';
          }

          if (fieldType == FieldType.contact && value.length != 10) {
            return 'Enter a 10-digit number';
          }

          return null;
        },
      ),
    );
  }
}
