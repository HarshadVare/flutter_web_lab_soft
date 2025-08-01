import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/providers/test_provider.dart';
import 'package:primecare_lab_soft/features/test_entry/data/models/test_entry_model.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/dialogs/add_code_dialog.dart';

class EditableTestTable extends ConsumerWidget {
  const EditableTestTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testEntries = ref.watch(testEntryProvider);
    final scrollController = ScrollController();

    return Column(
      children: [
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Table header
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                child: Row(
                  children: [
                    _headerCell("Code"),
                    _headerCell("Test Description"),
                    _headerCell("Fee"),
                    SizedBox(width: 40),
                  ],
                ),
              ),
              Divider(height: 0),
              // Table rows (use provider for entries)
              SizedBox(
                height: 250,
                child: Scrollbar(
                  thumbVisibility: true,
                  controller: scrollController,
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: testEntries.length,
                    itemBuilder: (ctx, i) {
                      final test = testEntries[i];
                      return Row(
                        children: [
                          SizedBox(width: 8),
                          _editableCell(
                            isRead: true,
                            initialValue: test.code,
                            onChanged: (val) => ref
                                .read(testEntryProvider.notifier)
                                .update(i, test.copyWith(code: val)),
                          ),
                          _editableCell(
                            initialValue: test.description,
                            onChanged: (val) => ref
                                .read(testEntryProvider.notifier)
                                .update(i, test.copyWith(description: val)),
                            flex: 2,
                          ),
                          _editableCell(
                            initialValue: test.fee == 0
                                ? ''
                                : test.fee.toString(),
                            onChanged: (val) => ref
                                .read(testEntryProvider.notifier)
                                .update(
                                  i,
                                  test.copyWith(fee: double.tryParse(val) ?? 0),
                                ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outline, color: Colors.red),
                            onPressed: () =>
                                ref.read(testEntryProvider.notifier).remove(i),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Divider(color: Colors.grey.shade300),
              Row(
                children: [
                  InkWell(
                    onTap: () async {
                      final code = await showDialog<String>(
                        context: context,
                        builder: (context) => AddCodeDialog(),
                      );
                      if (code != null && code.isNotEmpty) {
                        ref
                            .read(testEntryProvider.notifier)
                            .addEntry(
                              TestEntry(code: code, description: '', fee: 0),
                            );
                      }
                    },
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
                          '+ Add Test',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _headerCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _editableCell({
    bool isRead = false,
    required String initialValue,
    required ValueChanged<String> onChanged,
    int flex = 1,
  }) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          readOnly: isRead,
          initialValue: initialValue,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            isDense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
