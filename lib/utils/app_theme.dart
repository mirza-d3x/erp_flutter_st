import 'package:flutter/material.dart';

enum Mode { light, mid, dark }

class AppTheme extends InheritedWidget {
  const AppTheme({super.key, required super.child});

  static AppTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppTheme>()!;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
