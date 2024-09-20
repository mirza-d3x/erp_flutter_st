import 'package:erp_mobile/constants/theme/custom_theme.dart';
import 'package:erp_mobile/constants/theme/model_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FontColor {
  white,
  fontPrimary,
  fontSecondary,
  fontTertiary,
  primary,
  accent,
  success,
  danger,
  warning,
  info,
  purple,
  ultraviolet,
  dodgerBlue,
  dividentcolor,
  crisps,
  secretGarden,
  carnationRed,
  islandAqua,
  pacificBlue,
  silverDust,
  wTokenFontColor,
  mattPurple,
  buttonDisable,
  grey900,
  grey600,
  grey200,
}

enum FontStyle {
  headLineSmall,
  headLineLarge,
  titleMedium,
  headerLRegular,
  headerMBold,
  headerMSemiBold,
  headerMregular,
  headerSBold,
  headerSSemiBold,
  headerSregular,
  bodyLarge,
  headerXSSemiBold,
  headerXSregular,
  bodyLBold,
  bodyLSemiBold,
  bodyLregular,
  bodyMBold,
  bodyMSemiBold,
  bodyMregular,
  bodySBold,
  bodySSemiBold,
  bodySregular,
  tagNameLBold,
  tagNameLSemiBold,
  tagNameSBold,
  tagNameSSemiBold,
  titleSmall,
  bodySmall,
  bodySmallUnderLined,
  bodySmallSemiBold,
  titleSmallSemiBold,
  titleMediumSemiBold,
  titleleLargeMedBold,
  navigationLabelSelected,
  navigationLabelUnselected
}

ModelTheme customColors() {
  return CustomTheme.modelTheme;
}

TextStyle customTextStyle({required FontStyle fontStyle, FontColor? color}) {
  switch (fontStyle) {
    case FontStyle.titleSmall:
      return TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'NotoSans',
        color: getFontColor(color),
      );
    case FontStyle.headLineLarge:
      return TextStyle(
        fontSize: 32.sp,
        color: getFontColor(color),
        fontFamily: 'PPWoodland',
        fontWeight: FontWeight.w700,
      );
    case FontStyle.titleleLargeMedBold:
      return TextStyle(
        fontSize: 22.sp,
        color: getFontColor(color),
        fontFamily: 'PPWoodland',
        fontWeight: FontWeight.w700,
      );
    case FontStyle.headLineSmall:
      return TextStyle(
        fontSize: 24.sp,
        color: getFontColor(color),
        fontFamily: 'PPWoodland',
        fontWeight: FontWeight.w700,
      );
    case FontStyle.bodySmall:
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'NotoSans',
        color: getFontColor(color),
      );
    case FontStyle.bodySmallUnderLined:
      return TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        fontFamily: 'NotoSans',
        decoration: TextDecoration.underline,
        color: getFontColor(color),
      );
    case FontStyle.bodySmallSemiBold:
      return TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        fontFamily: 'NotoSans',
        color: getFontColor(color),
      );
    case FontStyle.titleMedium:
      return TextStyle(
        fontSize: 32.sp,
        color: getFontColor(color),
        fontFamily: 'PPWoodland',
        fontWeight: FontWeight.w400,
      );
    case FontStyle.titleSmallSemiBold:
      return TextStyle(
          fontSize: 16.sp,
          color: getFontColor(color),
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w500);
    case FontStyle.titleMediumSemiBold:
      return TextStyle(
          fontSize: 14.sp,
          color: getFontColor(color),
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w500);
    case FontStyle.headerLRegular:
      return TextStyle(
          fontSize: 34.sp,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.headerMBold:
      return TextStyle(
          fontSize: 24.sp,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.headerMSemiBold:
      return TextStyle(
          fontSize: 24,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.headerMregular:
      return TextStyle(
          fontSize: 24,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.headerSBold:
      return TextStyle(
          fontSize: 20,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.headerSSemiBold:
      return TextStyle(
          fontSize: 20,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.headerSregular:
      return TextStyle(
          fontSize: 20,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.bodyLarge:
      return TextStyle(
          fontSize: 16.sp,
          color: getFontColor(color),
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.headerXSSemiBold:
      return TextStyle(
          fontSize: 16.sp,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.headerXSregular:
      return TextStyle(
          fontSize: 16,
          color: getFontColor(color),
          letterSpacing: 0.5,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.bodyLBold:
      return TextStyle(
          fontSize: 14.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.bodyLSemiBold:
      return TextStyle(
          fontSize: 14.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.bodyLregular:
      return TextStyle(
          fontSize: 14.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.bodyMBold:
      return TextStyle(
          fontSize: 12.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.bodyMSemiBold:
      return TextStyle(
          fontSize: 12.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.bodyMregular:
      return TextStyle(
          fontSize: 12.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.bodySBold:
      return TextStyle(
          fontSize: 10.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.bodySSemiBold:
      return TextStyle(
          fontSize: 10.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.bodySregular:
      return TextStyle(
          fontSize: 10.sp,
          color: getFontColor(color),
          letterSpacing: 0.3,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w400);
    case FontStyle.tagNameLBold:
      return TextStyle(
          fontSize: 10.sp,
          color: getFontColor(color),
          letterSpacing: 0.2,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.tagNameLSemiBold:
      return TextStyle(
          fontSize: 10.sp,
          color: getFontColor(color),
          letterSpacing: 0.2,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.tagNameSBold:
      return TextStyle(
          fontSize: 9,
          color: getFontColor(color),
          letterSpacing: 0.2,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w700);
    case FontStyle.tagNameSSemiBold:
      return TextStyle(
          fontSize: 9,
          color: getFontColor(color),
          letterSpacing: 0.2,
          fontFamily: 'NotoSans',
          fontWeight: FontWeight.w600);
    case FontStyle.navigationLabelSelected:
      return TextStyle(
        fontSize: 10.sp,
        color: getFontColor(color),
        letterSpacing: 0.3,
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w600,
      );
    case FontStyle.navigationLabelUnselected:
      return TextStyle(
        fontSize: 10.sp,
        color: getFontColor(color),
        letterSpacing: 0.3,
        fontFamily: 'NotoSans',
        fontWeight: FontWeight.w500,
      );
  }
}

getFontColor(FontColor? color) {
  switch (color) {
    case FontColor.grey900:
      return const Color(0xff111928);
    case FontColor.grey600:
      return const Color(0xff4B5563);
    case FontColor.grey200:
      return const Color(0xffE5E7EB);
    case FontColor.white:
      return white;
    case FontColor.fontPrimary:
      return CustomTheme.modelTheme.fontPrimary;
    case FontColor.fontSecondary:
      return CustomTheme.modelTheme.fontSecondary;
    case FontColor.fontTertiary:
      return CustomTheme.modelTheme.fontTertiary;
    case FontColor.primary:
      return CustomTheme.modelTheme.primary;
    case FontColor.accent:
      return CustomTheme.modelTheme.accent;
    case FontColor.success:
      return CustomTheme.modelTheme.success;
    case FontColor.danger:
      return CustomTheme.modelTheme.danger;
    case FontColor.warning:
      return CustomTheme.modelTheme.warning;
    case FontColor.info:
      return CustomTheme.modelTheme.info;
    case FontColor.purple:
      return CustomTheme.modelTheme.mattPurple;
    case FontColor.ultraviolet:
      return CustomTheme.modelTheme.ultraviolet;
    case FontColor.dodgerBlue:
      return CustomTheme.modelTheme.dodgerBlue;
    case FontColor.dividentcolor:
      return CustomTheme.modelTheme.dividentColor;
    case FontColor.crisps:
      return CustomTheme.modelTheme.crisps;
    case FontColor.secretGarden:
      return CustomTheme.modelTheme.secretGarden;
    case FontColor.carnationRed:
      return CustomTheme.modelTheme.carnationRed;
    case FontColor.islandAqua:
      return CustomTheme.modelTheme.islandAqua;
    case FontColor.pacificBlue:
      return CustomTheme.modelTheme.pacificBlue;
    case FontColor.silverDust:
      return CustomTheme.modelTheme.silverDust;
    case FontColor.mattPurple:
      return CustomTheme.modelTheme.mattPurple;
    case FontColor.wTokenFontColor:
      return CustomTheme.modelTheme.wTokenFontColor;
    case FontColor.buttonDisable:
      return CustomTheme.modelTheme.pTokenBackground;
    default:
      return CustomTheme.modelTheme.fontSecondary;
  }
}

const LinearGradient gradientBackgroundPrimary = LinearGradient(
  begin: Alignment(-0.92, 0.39),
  end: Alignment(0.92, -0.39),
  colors: [
    Color(0xFFB1FCFF),
    Color(0xFFFFF4B3),
  ],
);

const LinearGradient gradientBackgroundPrimaryAppBar = LinearGradient(
  begin: Alignment(0.92, 0.39),
  end: Alignment(0.92, 0.39),
  colors: [
    Color(0xFFB1FCFF),
    Color(0xFFFFF4B3),
  ],
);

const Color primaryYellow = Color(0xffFFF9D3);
const Color primaryBlue = Color(0xffD1E9FA);
const Color white = Color(0xFFFFFFFF);
const Color peachBackground = Color(0xFFFFE6BF);

const Color primaryBlueButton = Color(0xff1D689B);
const Color primaryTealButton = Color(0XFF05A8AA);

const Color peachText = Color(0xFF806130);
const Color black = Color(0xFF000000);
const Color lightBlue = Color(0xffEAF7FF);

const Color grey900 = Color(0xff111928);
const Color grey700 = Color(0xff374151);

const Color transparent = Color(0x00FFFFFF);
const Color green1000 = Color(0xFF014642);
const Color green900 = Color(0xFF02514C);
const Color green800 = Color(0xFF036252);
const Color green700 = Color(0xFF057A5B);
const Color green600 = Color(0xFF08925F);
const Color green500 = Color(0xFF0BAA60);
const Color green400 = Color(0xFF3CCC7B);
const Color green300 = Color(0xFF64E58F);
const Color green200 = Color(0xFF9AF6AF);
const Color green100 = Color(0xFFCBFAD2);

const Color red1000 = Color(0xFF530921);
const Color red900 = Color(0xFF760E30);
const Color red800 = Color(0xFF8E1734);
const Color red700 = Color(0xFFB1253B);
const Color red600 = Color(0xFFD33641);
const Color red500 = Color(0xFFF64E4B);
const Color red400 = Color(0xFFF98477);
const Color red300 = Color(0xFFFCA693);
const Color red200 = Color(0xFFFECAB7);
const Color red100 = Color(0xFFFEE7DB);

const Color yellow1000 = Color(0xFF52360A);
const Color yellow900 = Color(0xFF6E4A12);
const Color yellow800 = Color(0xFF855F1E);
const Color yellow700 = Color(0xFFA67E30);
const Color yellow600 = Color(0xFFC69E46);
const Color yellow500 = Color(0xFFDEA511);
const Color yellow400 = Color(0xFFF0D587);
const Color yellow300 = Color(0xFFF7E4A0);
const Color yellow200 = Color(0xFFFCF1C1);
const Color yellow100 = Color(0xFFFDF8E0);

const Color blue1000 = Color(0xFF041552);
const Color blue900 = Color(0xFF0B2174);
const Color blue800 = Color(0xFF12308C);
const Color blue700 = Color(0xFF1D46AE);
const Color blue600 = Color(0xFF2B5FD0);
const Color blue500 = Color(0xFF3B7CF3);
const Color blue400 = Color(0xFF6BA1F7);
const Color blue300 = Color(0xFF89B9FB);
const Color blue200 = Color(0xFFB0D4FD);
const Color blue100 = Color(0xFFD7EBFE);
const Color blue50 = Color(0xFF14ABD1);

const Color semanticRed = Color(0xFFF98477);
