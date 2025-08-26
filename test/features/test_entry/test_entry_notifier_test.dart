// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:primecare_lab_soft/features/test_entry/data/models/test_entry_model.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/notifiers/test_entry_notifier.dart';

///Entry point for your tests (just like main() in Dart apps).
void main() {
  ///Groups related tests together under a label. Helps organize test results → you’ll see “TestEntryNotifier” in output.
  group('TestEntryNotifier', () {
    ///late ProviderContainer container;
    late TestEntryNotifier notifier; //instance of your TestEntryNotifier.

    ///setUp((){}); Runs before every test in this group.
    ///Ensures we start fresh each time (clean notifier.state).
    ///ProviderContainer() could be used if you had providers to override.
    setUp(() {
      // container = ProviderContainer();
      notifier = TestEntryNotifier();
    });

    test('initial state should be empty list', () {
      expect(notifier.state, []); //checks values.
    });

    test('addEntry should add an entry', () {
      final entry = TestEntry(code: 'Lab1', description: 'CBC', fee: 100);

      notifier.addEntry(entry);

      expect(notifier.state.length, 1);
      expect(notifier.state.first, entry);
    });

    test('update should modify entry at given index', () {
      final entry1 = TestEntry(
        code: 'Lab1',
        description: 'Urine Test',
        fee: 100,
      );
      final entry2 = TestEntry(code: 'Lab1', description: 'Blood', fee: 200);

      notifier.addEntry(entry1);
      notifier.update(0, entry2);

      expect(notifier.state.length, 1);
      expect(notifier.state[0], entry2);
    });

    test('remove should delete entry at given index', () {
      final entry1 = TestEntry(
        code: 'Lab1',
        description: 'Urine Test',
        fee: 100,
      );
      final entry2 = TestEntry(code: 'Lab1', description: 'Blood', fee: 200);

      notifier.addEntry(entry1);
      notifier.addEntry(entry2);

      notifier.remove(0);

      expect(notifier.state.length, 1);
      expect(notifier.state[0], entry2);
    });
  });
}

// 🔑 Summary of What’s Being Tested
// Initial State → Should be empty.

// addEntry → Appends correctly.

// update → Replaces the correct index.

// remove → Deletes correct element.
