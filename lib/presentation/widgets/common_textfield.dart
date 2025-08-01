
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final VoidCallback? onTap;
  final String labelText;
  final bool? isReadOnly;
  final TextEditingController? controller;
  const CommonTextField({
    super.key,
    required this.labelText,
    this.onTap,
    this.isReadOnly = false,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        ),
        readOnly: isReadOnly ?? false,
        onSaved: (value) {},
        onTap: onTap,
        validator: (value) =>
            value == null || value.isEmpty ? 'Required' : null,
      ),
    );
  }
}
