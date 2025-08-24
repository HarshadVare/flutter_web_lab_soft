import 'package:flutter/material.dart';
import 'package:primecare_lab_soft/common/widgets/common_dropdown.dart';
import 'package:primecare_lab_soft/features/test_entry/domain/entities/sdui_component.dart';
import 'package:primecare_lab_soft/features/test_entry/presentation/widgets/editable_test_table.dart';

/// -------------------------
/// Parser (Entity -> Widget)
/// -------------------------
class SduiParser {
  static Widget toWidget(SduiComponent component, BuildContext context) {
    if (component is SduiText) {
      return Text(
        component.value,
        style: TextStyle(
          fontSize: component.fontSize,
          fontWeight: component.fontWeight == "bold"
              ? FontWeight.bold
              : FontWeight.normal,
          color: _hexToColor(component.color),
        ),
      );
    } else if (component is SduiDropdown) {
      return CommonDropDownField(
        items: component.items,
        labelText: component.label,
        onChanged: (val) {},
      );
    } else if (component is SduiButton) {
      return InkWell(
        onTap: () {
          if (component.action.toLowerCase().contains("save")) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Saved!")));
          } else if (component.action.toLowerCase().contains("print")) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text("Print started...")));
          }
        },
        child: Container(
          margin: const EdgeInsets.only(left: 16, bottom: 10),
          height: component.height,
          width: component.width,
          decoration: BoxDecoration(
            color: _hexToColor(component.color),
            border: component.color == "#FFFFFF"
                ? Border.all(color: Colors.grey.shade300)
                : null,
            borderRadius: BorderRadius.circular(component.borderRadius),
          ),
          child: Center(
            child: Text(
              component.value,
              style: TextStyle(
                color: _hexToColor(component.textColor),
                fontSize: component.fontSize,
              ),
            ),
          ),
        ),
      );
    } else if (component is SduiRow) {
      return Row(
        mainAxisAlignment: _mapAlignment(component.alignment),
        children: component.children.map((c) => toWidget(c, context)).toList(),
      );
    } else if (component is SduiColumn) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: component.children.map((c) => toWidget(c, context)).toList(),
      );
    } else if (component is SduiContainer) {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: (component.padding['horizontal'] ?? 0).toDouble(),
          vertical: (component.padding['vertical'] ?? 0).toDouble(),
        ),
        margin: EdgeInsets.symmetric(
          horizontal: (component.margin['horizontal'] ?? 0).toDouble(),
          vertical: (component.margin['vertical'] ?? 0).toDouble(),
        ),
        height: component.height,
        decoration: BoxDecoration(
          color: _hexToColor(component.color),
          borderRadius: BorderRadius.circular(component.borderRadius),
        ),
        child: component.child != null
            ? toWidget(component.child!, context)
            : null,
      );
    } else if (component is SduiScrollView) {
      return SingleChildScrollView(
        child: component.child != null
            ? toWidget(component.child!, context)
            : null,
      );
    } else if (component is SduiSizedBox) {
      return SizedBox(width: component.width, height: component.height);
    } else if (component is SduiCustomWidget) {
      if (component.name == "EditableTestTable") {
        return EditableTestTable(); // with your real widget
      }
    }
    return const SizedBox();
  }

  static Color _hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static MainAxisAlignment _mapAlignment(String align) {
    switch (align.toLowerCase()) {
      case 'center':
        return MainAxisAlignment.center;
      case 'end':
        return MainAxisAlignment.end;
      case 'spacebetween':
        return MainAxisAlignment.spaceBetween;
      default:
        return MainAxisAlignment.start;
    }
  }
}
