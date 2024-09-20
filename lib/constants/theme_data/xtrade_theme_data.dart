import 'package:erp_mobile/constants/theme_data/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class ErpAppThemeData implements AppThemeData {
  @override
  ThemeData get sunriseLight => ThemeData(
      fontFamily: "Inter",
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFFFFFFF));

  @override
  ThemeData get nightfallDark => ThemeData.dark(useMaterial3: true);

  @override
  ThemeData get midnightBlack =>
      throw UnimplementedError("ThemeData not implemented");
}

final class XtradeSystemThemeData implements SystemThemeData {
  @override
  SystemUiOverlayStyle get nightfallDark => const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        systemStatusBarContrastEnforced: false,
      );

  @override
  SystemUiOverlayStyle get sunriseLight => const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemStatusBarContrastEnforced: false,
      );

  @override
  SystemUiOverlayStyle get midnightBlack =>
      throw UnimplementedError("ThemeData not implemented");
}
