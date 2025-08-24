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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: const [
                PatientInfo(),
                SizedBox(height: 10),
                // TestEntryPage(),
                SizedBox(height: 10),
                BillingActions(),
              ],
            ),
          ),
        ),
      );
    }

    // For web/tablet/desktop: side-by-side
    // return Expanded(
    //   child: Container(
    //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    //     child: TestEntryPage(),
    //     // child: SingleChildScrollView(
    //     //   child: Row(
    //     //     crossAxisAlignment: CrossAxisAlignment.start,
    //     //     children: [
    //     //       // Expanded(flex: 1, child: PatientInfo()),
    //     //       // const SizedBox(width: 12),
    //     //       // Expanded(flex: 2, child: TestEntry()),
    //     //       // const SizedBox(width: 12),
    //     //       // Expanded(flex: 1, child: BillingActions()),
    //     //     ],
    //     //   ),
    //     // ),
    //   ),
    // );

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
    );
  }
}
