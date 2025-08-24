// data/datasources/test_entry_local_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';

class TestEntryLocalDataSource {
  Future<Map<String, dynamic>> loadJson() async {
    final response = await rootBundle.loadString('assets/sdui/test_entry.json');
    return json.decode(response);
  }
}
