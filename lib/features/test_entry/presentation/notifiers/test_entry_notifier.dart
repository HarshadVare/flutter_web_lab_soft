import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/features/test_entry/data/models/test_entry_model.dart';

class TestEntryNotifier extends StateNotifier<List<TestEntry>> {
  TestEntryNotifier() : super([]);

  void addEntry(TestEntry entry) {
    state = [...state, entry];
  }

  void update(int index, TestEntry entry) {
    final updated = [...state];
    updated[index] = entry;
    state = updated;
  }

  void remove(int index) {
    final updated = [...state]..removeAt(index);
    state = updated;
  }
}
