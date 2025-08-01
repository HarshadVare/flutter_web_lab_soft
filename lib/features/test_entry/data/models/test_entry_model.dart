class TestEntry {
  final String code;
  final String description;
  final double fee;

  TestEntry({
    required this.code,
    required this.description,
    required this.fee,
  });

  TestEntry copyWith({String? code, String? description, double? fee}) {
    return TestEntry(
      code: code ?? this.code,
      description: description ?? this.description,
      fee: fee ?? this.fee,
    );
  }
}