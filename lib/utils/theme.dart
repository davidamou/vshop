import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vshop/constants/style.dart';

const primaryColor = Color(0XFF1E1E1E);
final materialColor = MaterialColor(
  primaryColor.value,
  {
    50: primaryColor.withOpacity(.08),
    100: primaryColor.withOpacity(.1),
    200: primaryColor.withOpacity(.2),
    300: primaryColor.withOpacity(.3),
    400: primaryColor.withOpacity(.4),
    500: primaryColor.withOpacity(.5),
    600: primaryColor.withOpacity(.6),
    700: primaryColor.withOpacity(.7),
    800: primaryColor.withOpacity(.8),
    900: primaryColor.withOpacity(.9),
  },
);

ThemeData theme(BuildContext context) {
  return ThemeData.light().copyWith(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: materialColor,
      backgroundColor: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
      titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontFamily: GoogleFonts.comfortaa().fontFamily,
            fontWeight: FontWeight.bold,
          ),
    ),
    textTheme: GoogleFonts.comfortaaTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 0.5),
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
      constraints: const BoxConstraints(maxHeight: 40.0),
      fillColor: materialColor.shade50,
      prefixIconColor: Colors.black54,
      enabledBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: defaultBorderRadius,
        borderSide: const BorderSide(color: Colors.transparent),
      ),
    ),
  );
}
