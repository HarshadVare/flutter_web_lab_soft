import 'package:primecare_lab_soft/features/test_entry/data/datasource/test_entry_data_source.dart';
import 'package:primecare_lab_soft/features/test_entry/domain/entities/sdui_component.dart';
import 'package:primecare_lab_soft/features/test_entry/domain/repositories/test_entry_repository.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/parser/sdui_mapper.dart';

class TestEntryRepositoryImpl implements TestEntryRepository {
  final TestEntryLocalDataSource localDataSource;

  TestEntryRepositoryImpl(this.localDataSource);

  @override
  Future<SduiComponent> getTestEntryUI() async {
    final json = await localDataSource.loadJson();
    return SduiMapper.fromJson(json);
  }
}
