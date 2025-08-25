import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/providers/sdui_ui_provider.dart';
import '../parser/sdui_parser.dart';


class TestEntryPage extends ConsumerWidget {
  const TestEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(sduiUiProvider);
    return  asyncValue.when(
        data: (uiComponent) => SduiParser.toWidget(uiComponent, context),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text("Error: $e")),
    );
  }
}
