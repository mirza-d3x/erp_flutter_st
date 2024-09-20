import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract interface class AppThemeData {
  ThemeData get sunriseLight;
  ThemeData get nightfallDark;
  ThemeData get midnightBlack;
}

abstract interface class SystemThemeData {
  SystemUiOverlayStyle get sunriseLight;
  SystemUiOverlayStyle get nightfallDark;
  SystemUiOverlayStyle get midnightBlack;
}
