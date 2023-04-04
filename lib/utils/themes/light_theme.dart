import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vshop/constants/style.dart';
import '../colors.dart';

var outlineInput = OutlineInputBorder(
  borderRadius: defaultBorderRadius,
  borderSide: const BorderSide(color: Colors.transparent),
);

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    scaffoldBackgroundColor: backgroundColor,
    textTheme: GoogleFonts.comfortaaTextTheme(),
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.black12,
      thickness: 1.0,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatch,
      backgroundColor: backgroundColor,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primarySwatch,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primarySwatch,
        side: BorderSide(color: primarySwatch.shade400),
        shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      unselectedItemColor: Colors.black54,
      selectedItemColor: primaryColor,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      filled: true,
      fillColor: primarySwatch.shade100,
      border: outlineInput,
      focusedBorder: outlineInput,
      enabledBorder: outlineInput,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primaryColor,
    ),
  );
}
