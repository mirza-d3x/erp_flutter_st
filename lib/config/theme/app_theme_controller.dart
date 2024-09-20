import 'package:erp_mobile/constants/theme_data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class AppThemeController extends ChangeNotifier {
  final AppThemeData _appThemeData;
  final SystemThemeData _systemThemeData;
  AppThemeMode _appThemeMode;

  AppThemeController({
    required AppThemeData appThemeData,
    required SystemThemeData systemThemeData,
    required AppThemeMode appThemeMode,
  })  : _appThemeData = appThemeData,
        _systemThemeData = systemThemeData,
        _appThemeMode = appThemeMode;

  AppThemeMode get appThemeMode => _appThemeMode;

  ThemeData get appThemeDataFromAppThemeMode {
    switch (appThemeMode) {
      case AppThemeMode.sunriseLight:
        return _appThemeData.sunriseLight;
      case AppThemeMode.nightfallDark:
        return _appThemeData.nightfallDark;
      case AppThemeMode.midnightBlack:
        return _appThemeData.midnightBlack;
    }
  }

  SystemUiOverlayStyle get systemThemeDataFromAppThemeMode {
    switch (appThemeMode) {
      case AppThemeMode.sunriseLight:
        return _systemThemeData.sunriseLight;
      case AppThemeMode.nightfallDark:
        return _systemThemeData.nightfallDark;
      case AppThemeMode.midnightBlack:
        return _systemThemeData.midnightBlack;
    }
  }

  ThemeMode get themeModeFromAppThemeMode {
    switch (appThemeMode) {
      case AppThemeMode.sunriseLight:
        return ThemeMode.light;
      case AppThemeMode.nightfallDark:
        return ThemeMode.dark;
      case AppThemeMode.midnightBlack:
        return ThemeMode.dark;
    }
  }

  void switchThemeMode(AppThemeMode appThemeMode) {
    if (appThemeMode != _appThemeMode) {
      _appThemeMode = appThemeMode;
      notifyListeners();
    }
  }
}

enum AppThemeMode { sunriseLight, nightfallDark, midnightBlack }
