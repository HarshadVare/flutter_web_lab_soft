import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/common/providers/responsive_provider.dart';
import 'package:primecare_lab_soft/common/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/common/widgets/common_textfield.dart';

class BillingActions extends ConsumerWidget {
  const BillingActions({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceType = ref.watch(responsiveProvider(context));
    final isMob = isMobile(deviceType);

    final content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 12),
        Text(
          'Billing & Actions',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 12),
        _fields(),
        SizedBox(height: 8),
        CommonDropDownField(
          items: ['Cash', 'Card'],
          labelText: 'Payment Type',
          onChanged: (value) {},
        ),
        SizedBox(height: 8),
        CommonDropDownField(
          items: ['Non Cashless'],
          labelText: 'Patient Type',
          onChanged: (value) {},
        ),
        SizedBox(height: 12),
      ],
    );

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: isMob ? null : 600,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: isMob ? SingleChildScrollView(child: content) : content,
    );
  }

  // Helper: All text fields, less repetition, easy to add/reorder
  Widget _fields() {
    const labels = [
      'Inv Fees',
      'Visiting Charges',
      'Other Charges',
      'Discount',
      'Net Total',
      'Paid',
      'Balance',
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics:
          const NeverScrollableScrollPhysics(), // Avoid nested scroll issues
      itemCount: labels.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        return CommonTextField(
          key: ValueKey(
            labels[index],
          ), // Helps Flutter efficiently reuse widgets
          labelText: labels[index],
          fieldType: FieldType.number,
        );
      },
    );
  }
}
