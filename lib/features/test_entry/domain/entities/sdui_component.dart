abstract class SduiComponent {}

class SduiText extends SduiComponent {
  final String value;
  final double fontSize;
  final String color;
  final String fontWeight;
  SduiText({
    required this.value,
    required this.fontSize,
    required this.color,
    required this.fontWeight,
  });
}

class SduiDropdown extends SduiComponent {
  final String label;
  final List<String> items;
  SduiDropdown({required this.label, required this.items});
}

class SduiButton extends SduiComponent {
  final String value;
  final double width;
  final double height;
  final String color;
  final String textColor;
  final double fontSize;
  final double borderRadius;
  final String? borderColor;
  final Map<String, dynamic> margin;
  final String action;
  SduiButton({
    required this.value,
    required this.width,
    required this.height,
    required this.color,
    required this.textColor,
    required this.fontSize,
    required this.borderRadius,
    this.borderColor,
    required this.margin,
    required this.action,
  });
}

class SduiRow extends SduiComponent {
  final String alignment;
  final List<SduiComponent> children;
  SduiRow({required this.alignment, required this.children});
}

class SduiColumn extends SduiComponent {
  final String crossAxisAlignment;
  final List<SduiComponent> children;
  SduiColumn({required this.crossAxisAlignment, required this.children});
}

class SduiContainer extends SduiComponent {
  final Map<String, dynamic> padding;
  final Map<String, dynamic> margin;
  final double? height;
  final String color;
  final double borderRadius;
  final SduiComponent? child;
  SduiContainer({
    required this.padding,
    required this.margin,
    required this.height,
    required this.color,
    required this.borderRadius,
    this.child,
  });
}

class SduiScrollView extends SduiComponent {
  final SduiComponent? child;
  SduiScrollView({this.child});
}

class SduiSizedBox extends SduiComponent {
  final double width;
  final double height;
  SduiSizedBox({required this.width, required this.height});
}

class SduiCustomWidget extends SduiComponent {
  final String name;
  SduiCustomWidget({required this.name});
}
