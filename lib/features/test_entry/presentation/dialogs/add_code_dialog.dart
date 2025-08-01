import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/common/widgets/common_dropdown.dart';

class AddCodeDialog extends StatefulWidget {
  const AddCodeDialog({super.key});
  @override
  State<AddCodeDialog> createState() => _AddCodeDialogState();
}

class _AddCodeDialogState extends State<AddCodeDialog> {
  String? selectedValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: AlertDialog(
        title: Text('Enter Test Code'),
        content: CommonDropDownField(
          items: ['CBC', 'LFT'],
          labelText: 'Code',
          onChanged: (value) {
            setState(() => selectedValue = value);
          },
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          ),
          ElevatedButton(
            child: Text('Add'),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pop(context, selectedValue);
              }
            },
          ),
        ],
      ),
    );
  }
}
