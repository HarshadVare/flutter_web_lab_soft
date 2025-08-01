import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum DeviceType { mobile, tablet, desktop }

final responsiveProvider = Provider.family<DeviceType, BuildContext>((
  ref,
  context,
) {
  final width = MediaQuery.of(context).size.width;
  if (width < 850) {
    return DeviceType.mobile;
  } else if (width < 1100) {
    return DeviceType.tablet;
  } else {
    return DeviceType.desktop;
  }
});

// Helper methods for easier checks
bool isMobile(DeviceType type) => type == DeviceType.mobile;
bool isTablet(DeviceType type) => type == DeviceType.tablet;
bool isDesktop(DeviceType type) => type == DeviceType.desktop;
