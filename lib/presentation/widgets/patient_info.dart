import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/presentation/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/presentation/widgets/common_textfield.dart';

class PatientInfo extends StatefulWidget {
  const PatientInfo({super.key});

  @override
  State<PatientInfo> createState() => _PatientInfoState();
}

class _PatientInfoState extends State<PatientInfo> {
  DateTime? _selectedDate;
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Text(
              'Patient Info',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            CommonDropDownField(
              items: ['ID1', 'ID2', 'ID3'],
              labelText: 'Lab Id',
              onChanged: (value) {
              },
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Patient Name'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Contact Number'),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(
                  width: 100,
                  child: CommonDropDownField(
                    items: ['Dr', 'Self'],
                    labelText: 'Ref By',
                    onChanged: (value) {
                    },
                  ),
                ),
                SizedBox(width: 8),
                Expanded(child: CommonTextField(labelText: 'Refer Name')),
              ],
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Age'),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Male', 'Female', 'Transgender', 'Other'],
              labelText: 'Sex',
              onChanged: (value) {
              },
            ),
            SizedBox(height: 8),
            CommonTextField(labelText: 'PRN'),
            SizedBox(height: 8),
            CommonTextField(
              controller: _dateController,
              isReadOnly: true,
              onTap: () async {
                FocusScope.of(
                  context,
                ).requestFocus(FocusNode()); // Remove keyboard
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: _selectedDate ?? DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _selectedDate = picked;
                    _dateController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  });
                }
              },
              labelText: 'Reg. Date',
              // validator: (value) =>
              //     value == null || value.isEmpty ? 'Required' : null,
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
