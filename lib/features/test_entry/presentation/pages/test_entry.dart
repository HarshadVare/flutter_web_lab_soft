import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/common/providers/responsive_provider.dart';
import 'package:primecare_lab_soft/common/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/widgets/editable_test_table.dart';

class TestEntry extends ConsumerWidget {
  const TestEntry({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final deviceType = ref.watch(responsiveProvider(context));
    final isMob = isMobile(deviceType);

    final content = Column(
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
          labelText: 'Sample Info',
          onChanged: (value) {},
        ),
        SizedBox(height: 8),
        EditableTestTable(),
        SizedBox(height: 24), // Give bottom spacing instead of Spacer()
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
}
