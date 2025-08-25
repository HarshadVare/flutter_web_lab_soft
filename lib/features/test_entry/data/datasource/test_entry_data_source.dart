// data/datasources/test_entry_local_data_source.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:primecare_lab_soft/common/constants/json.dart';

abstract class TestEntryDataSource {
  Future<Map<String, dynamic>> loadUiJson();
}

class TestEntryDataSourceImpl implements TestEntryDataSource {
  @override
  Future<Map<String, dynamic>> loadUiJson() async {
    final response = await rootBundle.loadString(SduiJson.testEntry);
    return json.decode(response);
  }
}
