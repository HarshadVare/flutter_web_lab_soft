import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/application/notifiers/test_entry_notifier.dart';
import 'package:primecare_lab_soft/data/models/test_entry_model.dart';

final testEntryProvider =
    StateNotifierProvider<TestEntryNotifier, List<TestEntry>>((ref) {
      return TestEntryNotifier();
    });
