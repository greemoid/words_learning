import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:words_learning/core/theme/color_palette.dart';

class WordsTheme {
  static final lightThemeMode = ThemeData.light().copyWith(
    scaffoldBackgroundColor: ColorPalette.backgroundColor,
    appBarTheme:
        const AppBarTheme(backgroundColor: ColorPalette.backgroundColor),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      titleMedium: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
      bodyLarge: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
      bodyMedium: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      bodySmall: GoogleFonts.montserrat(
        textStyle: TextStyle(
          color: Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}
