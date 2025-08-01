
import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/presentation/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/presentation/widgets/editable_test_table.dart';

class TestEntry extends StatelessWidget {
  const TestEntry({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
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
              'Sample/Order & Test Entry',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 12),
            CommonDropDownField(
              items: ['Main Lab', 'Other Lab'],
              labelText: 'Location',
              onChanged: (value) {},
            ),
            SizedBox(height: 8),
            CommonDropDownField(
              items: [
                'Sample Collected At Lab',
                'Sample Collected At Home',
                'Sample Collected At Hospital/Clinic',
              ],
              labelText: 'Smaple Info',
              onChanged: (value) {},
            ),
            SizedBox(height: 8),
            EditableTestTable(),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  ),
                ),
                // SizedBox(width: 10),
                InkWell(
                  onTap: () async {},
                  child: Container(
                    margin: EdgeInsets.only(left: 16, bottom: 10),
                    height: 35,
                    width: 90,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(
                      child: Text(
                        'Print',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

