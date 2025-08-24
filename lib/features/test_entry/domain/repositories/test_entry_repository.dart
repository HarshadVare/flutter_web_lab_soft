import '../entities/sdui_component.dart';

abstract class TestEntryRepository {
  Future<SduiComponent> getTestEntryUI();
}
