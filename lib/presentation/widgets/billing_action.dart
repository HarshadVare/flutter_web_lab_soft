import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/presentation/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/presentation/widgets/common_textfield.dart';

class BillingActions extends StatelessWidget {
  const BillingActions({super.key});

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
            CommonTextField(labelText: 'Inv Fees'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Visiting Charges'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Other Charges'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Discount'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Net Total'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Paid'),
            SizedBox(height: 8),
            CommonTextField(labelText: 'Balance'),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Cash', 'Card'],
              labelText: 'Payment Type',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
            CommonDropDownField(
              items: ['Non Cashless'],
              labelText: 'Patient Type',
              onChanged: (value) {
                // Handle your logic here
                print("Selected: $value");
                // setState(() => yourSelectedValue = value);
              },
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
