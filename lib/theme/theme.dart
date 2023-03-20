import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  final ThemeData lightTheme = ThemeData(
      primarySwatch: Colors.indigo,
      fontFamily: GoogleFonts.laila().fontFamily,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white, foregroundColor: Colors.black)));
  final ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.laila().fontFamily,
    // primaryColor: Colors.black,
    colorScheme: const ColorScheme.dark(primary: Colors.white),
  );
}
