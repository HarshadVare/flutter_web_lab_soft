import '../entities/sdui_component.dart';
import '../repositories/test_entry_repository.dart';

class GetTestEntryUI {
  final TestEntryRepository repository;
  GetTestEntryUI(this.repository);

  Future<SduiComponent> call() {
    return repository.getTestEntryUI();
  }
}
