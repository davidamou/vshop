import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../colors.dart';
import '../../constants/style.dart';
import 'light_theme.dart';

ThemeData darkTheme(BuildContext context) {
  return ThemeData.dark().copyWith(
    useMaterial3: true,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: primarySwatchDark,
      brightness: Brightness.dark,
    ),
    dividerTheme: const DividerThemeData(
      color: Colors.white12,
      thickness: 1.0,
    ),
    textTheme: GoogleFonts.comfortaaTextTheme().apply(
      bodyColor: Colors.white,
      displayColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: primarySwatchDark,
        shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: primarySwatchDark),
        shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: primaryColorDark.withOpacity(0.4),
      selectedItemColor: primaryColorDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      filled: true,
      fillColor: primarySwatchDark.shade300,
      border: outlineInput,
      focusedBorder: outlineInput,
      enabledBorder: outlineInput,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: primaryColorDark,
    ),
  );
}
