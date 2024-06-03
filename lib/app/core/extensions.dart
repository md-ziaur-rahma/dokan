import 'package:flutter/material.dart';

extension DeviceSize on BuildContext {
  bool get isTab {
    final width = MediaQuery.of(this).size.width;
    return width > 500;
  }
}
