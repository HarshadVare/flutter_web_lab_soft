import 'package:primecare_lab_soft/features/test_entry/domain/entities/sdui_component.dart';

/// -------------------------
/// Mapper (JSON -> Entity)
/// -------------------------
class SduiMapper {
  static SduiComponent fromJson(Map<String, dynamic> json) {
    switch (json['type']?.toString().toLowerCase()) {
      case 'text':
        return SduiText(
          value: json['value'] ?? '',
          fontSize: (json['style']?['fontSize'] ?? 14).toDouble(),
          color: json['style']?['color'] ?? '#000000',
          fontWeight: json['style']?['fontWeight'] ?? 'normal',
        );
      case 'dropdown':
        return SduiDropdown(
          label: json['labelText'] ?? json['label'] ?? '',
          items: List<String>.from(json['items'] ?? []),
        );
      case 'button':
        return SduiButton(
          value: json['text'] ?? json['value'] ?? '',
          width: (json['width'] ?? 100).toDouble(),
          height: (json['height'] ?? 40).toDouble(),
          color: json['backgroundColor'] ?? json['color'] ?? '#FFFFFF',
          textColor: json['textColor'] ?? '#000000',
          fontSize: (json['fontSize'] ?? 14).toDouble(),
          borderRadius: (json['borderRadius'] ?? 0).toDouble(),
          margin: json['margin'] ?? {},
          action: json['action']?['type'] ?? '',
        );
      case 'row':
        return SduiRow(
          alignment: json['mainAxisAlignment'] ?? 'start',
          children: (json['children'] as List<dynamic>)
              .map((child) => fromJson(child))
              .toList(),
        );
      case 'column':
        return SduiColumn(
          crossAxisAlignment: json['crossAxisAlignment'] ?? 'start',
          children: (json['children'] as List<dynamic>)
              .map((child) => fromJson(child))
              .toList(),
        );
      case 'container':
        return SduiContainer(
          padding: json['padding'] ?? {},
          margin: json['margin'] ?? {},
          height: (json['height'] is num) ? (json['height']).toDouble() : null,
          color: json['decoration']?['color'] ?? '#FFFFFF',
          borderRadius: (json['decoration']?['borderRadius'] ?? 0).toDouble(),
          child: json['child'] != null ? fromJson(json['child']) : null,
        );
      case 'singlechildscrollview':
        return SduiScrollView(
          child: json['child'] != null ? fromJson(json['child']) : null,
        );
      case 'sizedbox':
        return SduiSizedBox(
          width: (json['width'] ?? 0).toDouble(),
          height: (json['height'] ?? 0).toDouble(),
        );
      case 'widget':
      case 'customwidget':
        return SduiCustomWidget(name: json['name']);
      default:
        throw Exception("Unknown widget type: ${json['type']}");
    }
  }
}
