import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/features/test_entry/data/datasource/test_entry_data_source.dart';
import 'package:primecare_lab_soft/features/test_entry/data/repositories/test_entry_repository_impl.dart';
import 'package:primecare_lab_soft/features/test_entry/domain/usecases/get_test_entry_ui.dart';

final sduiUiProvider = FutureProvider((ref) async {
  final dataSource = TestEntryLocalDataSource();
  final repository = TestEntryRepositoryImpl(dataSource);
  final usecase = GetTestEntryUI(repository);
  return await usecase();
});
