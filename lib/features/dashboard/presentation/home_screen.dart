import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/common/utils/responsive.dart';
import 'package:primecare_lab_soft/features/billing_entry/presentation/pages/billing_action.dart';
import 'package:primecare_lab_soft/features/patient_entry/presentation/pages/patient_info.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/pages/test_entry.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      // For mobile, stack panels vertically, scrollable
      return Expanded(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              PatientInfo(),
              SizedBox(height: 10),
              TestEntryPage(),
              SizedBox(height: 10),
              BillingActions(),
            ],
          ),
        ),
      );
    }

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: SingleChildScrollView(
          child: IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: PatientInfo()),
                const SizedBox(width: 12),
                Expanded(flex: 2, child: TestEntryPage()),
                const SizedBox(width: 12),
                Expanded(flex: 1, child: BillingActions()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
