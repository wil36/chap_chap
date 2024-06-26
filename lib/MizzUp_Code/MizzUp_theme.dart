// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: avoid_classes_with_only_static_members
class MizzUpTheme {
  static const Color primaryColor = Color(0xFF844631);
  static const Color secondaryColor = Color(0xFFF2D0BD);
  static const Color tertiaryColor = Color(0xFFB77E65);

  String primaryFontFamily = 'Poppins';
  String secondaryFontFamily = 'Roboto';
  static TextStyle get title1 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      );
  static TextStyle get title2 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 22,
      );
  static TextStyle get title3 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 20,
      );
  static TextStyle get subtitle1 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      );
  static TextStyle get subtitle2 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );
  static TextStyle get bodyText1 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );

  static TextStyle get bodyText3 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
  static TextStyle get bodyText2 => const TextStyle(
        fontFamily: 'IBM',
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 14,
      );
}

extension TextStyleHelper on TextStyle {
  TextStyle override({
    String? fontFamily,
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    bool useGoogleFonts = true,
    double? lineHeight,
  }) =>
      useGoogleFonts
          ? GoogleFonts.getFont(
              fontFamily!,
              color: color ?? this.color,
              fontSize: fontSize ?? this.fontSize,
              fontWeight: fontWeight ?? this.fontWeight,
              fontStyle: fontStyle ?? this.fontStyle,
              height: lineHeight,
            )
          : copyWith(
              fontFamily: fontFamily,
              color: color,
              fontSize: fontSize,
              fontWeight: fontWeight,
              fontStyle: fontStyle,
              height: lineHeight,
            );
}
