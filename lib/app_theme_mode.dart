import 'package:flutter/material.dart';

enum AppThemeMode {
  system,
  light,
  dark,
  pureBlack;

  ThemeMode toThemeMode() {
    switch (this) {
      case AppThemeMode.system:
        return ThemeMode.system;
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
      case AppThemeMode
          .pureBlack: // Pure black will also use ThemeMode.dark for the base
        return ThemeMode.dark;
    }
  }
}
