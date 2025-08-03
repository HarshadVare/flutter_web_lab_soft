import 'package:flutter/material.dart';

class CommonDropDownField extends StatefulWidget {
  final String labelText;
  final List<String> items;
  final String? selectedValue;
  final void Function(String?) onChanged;
  const CommonDropDownField({
    super.key,
    required this.items,
    required this.labelText,
    this.selectedValue,
    required this.onChanged,
  });

  @override
  State<CommonDropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<CommonDropDownField> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownButtonFormField(
        decoration: InputDecoration(
          labelText: widget.labelText,
          border: OutlineInputBorder(),
        ),
        items: widget.items.map((item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList(),
        value: selectedValue,
        onChanged: (value) {
          widget.onChanged(value);
        },
        validator: (value) => value == null ? 'Please select an option' : null,
      ),
    );
  }
}
