import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/notifiers/test_entry_notifier.dart';
import 'package:primecare_lab_soft/features/test_entry/data/models/test_entry_model.dart';

final testEntryProvider =
    StateNotifierProvider<TestEntryNotifier, List<TestEntry>>((ref) {
      return TestEntryNotifier();
    });
