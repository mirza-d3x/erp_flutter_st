import 'package:erp_mobile/constants/theme/custom_theme.dart';
import 'package:flutter/material.dart';

class ModelTheme {
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color backgroundTertiary;
  final Color fontPrimary;
  final Color fontSecondary;
  final Color fontTertiary;
  final Color primary;
  final Color cardPrimary;
  final Color accent;
  final Color success;
  final Color danger;
  final Color warning;
  final Color info;
  final Color green1;
  final Color green2;
  final Color green3;
  final Color red1;
  final Color red2;
  final Color red3;
  final Color mattPurple;
  final Color ultraviolet;
  final Color dodgerBlue;
  final Color dividentColor;
  final Color crisps;
  final Color secretGarden;
  final Color carnationRed;
  final Color islandAqua;
  final Color pacificBlue;
  final Color silverDust;
  final Color wTokenBackground;
  final Color wTokenFontColor;
  final Color pTokenBackground;
  final Color pTokenFontColor;
  final Color adBackground;
  final Color green4;
  final CustomMode mode;
  final Color green600;
  final Color peachBackgrond;
  final Color grey;
  final Color grey900;
  final Color grey300;
  final Color grey100;
  final Color grey400;
  final Color grey500;
  final Color grey600;
  final Color lightBlue;
  final Color blue200;
  final Color bluePrimary;

  ModelTheme(
    this.mode, {
    required this.blue200,
    required this.grey100,
    required this.grey500,
    required this.bluePrimary,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.backgroundTertiary,
    required this.fontPrimary,
    required this.fontSecondary,
    required this.fontTertiary,
    required this.primary,
    required this.accent,
    required this.success,
    required this.danger,
    required this.warning,
    required this.info,
    required this.green1,
    required this.green2,
    required this.green3,
    required this.green4,
    required this.red1,
    required this.red2,
    required this.red3,
    required this.mattPurple,
    required this.ultraviolet,
    required this.dodgerBlue,
    required this.dividentColor,
    required this.crisps,
    required this.secretGarden,
    required this.carnationRed,
    required this.islandAqua,
    required this.pacificBlue,
    required this.silverDust,
    required this.wTokenBackground,
    required this.wTokenFontColor,
    required this.pTokenBackground,
    required this.pTokenFontColor,
    required this.green600,
    required this.adBackground,
    required this.peachBackgrond,
    required this.grey,
    required this.grey900,
    required this.grey300,
    required this.grey400,
    required this.grey600,
    required this.lightBlue,
    required this.cardPrimary,
  });

  ModelTheme copyWith({
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? backgroundTertiary,
    Color? fontPrimary,
    Color? fontSecondary,
    Color? fontTertiary,
    Color? primary,
    Color? cardPrimary,
    Color? accent,
    Color? success,
    Color? danger,
    Color? warning,
    Color? info,
    Color? green1,
    Color? green2,
    Color? green3,
    Color? green4,
    Color? red1,
    Color? red2,
    Color? red3,
    Color? mattPurple,
    Color? ultraviolet,
    Color? dodgerBlue,
    Color? dividentColor,
    Color? crisps,
    Color? secretGarden,
    Color? carnationRed,
    Color? islandAqua,
    Color? pacificBlue,
    Color? silverDust,
    Color? wTokenBackground,
    Color? wTokenFontColor,
    Color? pTokenBackground,
    Color? pTokenFontColor,
    Color? adBackground,
    Color? green600,
    Color? peachBackgrond,
    Color? grey,
    Color? grey900,
    Color? grey300,
    Color? grey100,
    Color? grey400,
    Color? grey500,
    Color? grey600,
    Color? lightBlue,
    Color? bluePrimary,
  }) {
    return ModelTheme(
      mode,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      backgroundTertiary: backgroundTertiary ?? this.backgroundTertiary,
      fontPrimary: fontPrimary ?? this.fontPrimary,
      fontSecondary: fontSecondary ?? this.fontSecondary,
      fontTertiary: fontTertiary ?? this.fontTertiary,
      primary: primary ?? this.primary,
      accent: accent ?? this.accent,
      success: success ?? this.success,
      danger: danger ?? this.danger,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      green1: green1 ?? this.green1,
      green2: green2 ?? this.green2,
      green3: green3 ?? this.green3,
      green4: green4 ?? this.green4,
      red1: red1 ?? this.red1,
      red2: red2 ?? this.red2,
      red3: red3 ?? this.red3,
      mattPurple: mattPurple ?? this.mattPurple,
      ultraviolet: ultraviolet ?? this.ultraviolet,
      dodgerBlue: dodgerBlue ?? this.dodgerBlue,
      dividentColor: dividentColor ?? this.dividentColor,
      crisps: crisps ?? this.crisps,
      secretGarden: secretGarden ?? this.secretGarden,
      carnationRed: carnationRed ?? this.carnationRed,
      islandAqua: islandAqua ?? this.islandAqua,
      pacificBlue: pacificBlue ?? this.pacificBlue,
      silverDust: silverDust ?? this.silverDust,
      wTokenBackground: wTokenBackground ?? this.wTokenBackground,
      wTokenFontColor: wTokenFontColor ?? this.wTokenFontColor,
      pTokenBackground: pTokenBackground ?? this.pTokenBackground,
      pTokenFontColor: pTokenFontColor ?? this.pTokenFontColor,
      green600: green600 ?? this.green600,
      adBackground: adBackground ?? this.adBackground,
      peachBackgrond: peachBackgrond ?? this.peachBackgrond,
      grey: grey ?? this.grey,
      grey900: grey900 ?? this.grey900,
      grey300: grey300 ?? this.grey300,
      grey400: grey400 ?? this.grey400,
      grey600: grey600 ?? this.grey600,
      lightBlue: lightBlue ?? this.lightBlue,
      bluePrimary: bluePrimary ?? this.bluePrimary,
      grey100: grey100 ?? this.grey100,
      grey500: grey500 ?? this.grey500,
      blue200: blue200,
      cardPrimary: this.cardPrimary,
    );
  }
}

ModelTheme lightModel = ModelTheme(
  CustomMode.light,
  backgroundPrimary: const Color(0xFFFFFFFF),
  backgroundSecondary: const Color(0xFFF5F8FA),
  backgroundTertiary: const Color(0xFFE8EBED),
  fontPrimary: const Color(0xFF292C33),
  fontSecondary: const Color(0xFF6B7483),
  fontTertiary: const Color(0xFFA1A7B0),
  primary: const Color(0xFF07877B),
  accent: const Color(0xFFFFC160),
  success: const Color(0xFF0BAA60),
  danger: const Color(0xFFF64E4B),
  warning: const Color(0xFFE7C160),
  info: const Color(0xFF3B7CF3),
  green1: const Color(0xFF00674B),
  green2: const Color(0xFF367C2B),
  green3: const Color(0xFF88A762),
  green4: const Color(0xff9CCFCA),
  red1: const Color(0xFFA42525),
  red2: const Color(0xFFDC2626),
  red3: const Color(0xFFF85F5F),
  mattPurple: const Color(0xFF9768E1),
  ultraviolet: const Color(0xFFBF3ECF),
  dodgerBlue: const Color(0xFF3B7CF3),
  dividentColor: const Color(0xFFE7A640),
  crisps: const Color(0xFFE7A640),
  secretGarden: const Color(0xFF0BAA60),
  carnationRed: const Color(0xFFF64E4B),
  islandAqua: const Color(0xFF2DB9B9),
  pacificBlue: const Color(0xFF0395BE),
  silverDust: const Color(0xFFBEC3CA),
  wTokenBackground: const Color(0xFFFFDAA0),
  wTokenFontColor: const Color(0xFFB38743),
  pTokenBackground: const Color(0xFF9CCFCA),
  pTokenFontColor: const Color(0xFF055F56),
  green600: const Color(0xFF08925F),
  adBackground: const Color(0xFFFFF3DF),
  peachBackgrond: const Color(0xFFFFE6BF),
  grey: const Color(0xFF9D9D9D),
  grey900: const Color(0xff111928),
  grey300: const Color(0xffD1D5DB),
  grey400: const Color(0xff9CA3AF),
  grey600: const Color(0xff4B5563),
  lightBlue: const Color(0xffEAF7FF),
  bluePrimary: const Color(0xff1D689B),
  grey100: const Color(0xFFF3F4F6),
  grey500: const Color(0xff6B7280),
  blue200: const Color(0xFFC3DDFD),
  cardPrimary: const Color(0xffEAF7FF),
);

ModelTheme darkModel = ModelTheme(
  CustomMode.dark,
  backgroundPrimary: const Color(0xFF0E0F12),
  backgroundSecondary: const Color(0xFF1D1E24),
  backgroundTertiary: const Color(0xFF31353E),
  fontPrimary: const Color(0xFFF1F1F1),
  fontSecondary: const Color(0xFF9EA4AF),
  fontTertiary: const Color(0xFF5B616B),
  primary: const Color(0xFF399F95),
  accent: const Color(0xFFFFCD80),
  success: const Color(0xFF3CCC7B),
  danger: const Color(0xFFF98477),
  warning: const Color(0xFFF0D587),
  info: const Color(0xFF6BA1F7),
  green1: const Color(0xFF28A376),
  green2: const Color(0xFF6CB059),
  green3: const Color(0xFFB0CA8B),
  green4: const Color(0xff6AB7B0),
  red1: const Color(0xFFC85E54),
  red2: const Color(0xFFEA6558),
  red3: const Color(0xFFFA9086),
  mattPurple: const Color(0xFFB68DEC),
  ultraviolet: const Color(0xFFDE6BE2),
  dodgerBlue: const Color(0xFF6BA1F7),
  dividentColor: const Color(0xFFE7A640),
  crisps: const Color(0xFFF0C26E),
  secretGarden: const Color(0xFF3CCC7B),
  carnationRed: const Color(0xFFF98477),
  islandAqua: const Color(0xFF5CD5CA),
  pacificBlue: const Color(0xFF38C0D8),
  silverDust: const Color(0xFFD5D9DF),
  wTokenBackground: const Color(0xFFFFDAA0),
  wTokenFontColor: const Color(0xFFB38743),
  pTokenBackground: const Color(0xFF9CCFCA),
  pTokenFontColor: const Color(0xFF055F56),
  green600: const Color(0xFF08925F),
  adBackground: const Color(0xFF804f00),
  peachBackgrond: const Color(0xFFFFE6BF),
  grey: const Color(0xFF9D9D9D),
  grey900: const Color(0xff111928),
  grey300: const Color(0xffD1D5DB),
  grey400: const Color(0xff9CA3AF),
  grey600: const Color(0xff4B5563),
  lightBlue: const Color(0xffEAF7FF),
  bluePrimary: const Color(0xff1D689B),
  grey100: const Color(0xFFF3F4F6),
  grey500: const Color(0xff6B7280),
  blue200: const Color(0xFFC3DDFD),
  cardPrimary: const Color(0xffEAF7FF),
);
