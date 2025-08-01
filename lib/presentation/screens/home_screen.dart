import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/presentation/widgets/billing_action.dart';
import 'package:primecare_lab_soft/presentation/widgets/patient_info.dart';
import 'package:primecare_lab_soft/presentation/widgets/test_entry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          PatientInfo(),
          SizedBox(width: 8),
          TestEntry(),
          SizedBox(width: 8),
          BillingActions(),
        ],
      ),
    );
  }
}
