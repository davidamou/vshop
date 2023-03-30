import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vshop/constants/style.dart';
import '../../constants/colors.dart';

var elevateButton = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    elevation: 0,
    foregroundColor: backgroundColor,
    backgroundColor: primarySwatch,
    shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
  ),
);

var outlineButton = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: primarySwatch,
    side: BorderSide(color: primarySwatch.shade400),
    shape: RoundedRectangleBorder(borderRadius: defaultBorderRadius),
  ),
);

var bottomNavigationStyle = const BottomNavigationBarThemeData(
  unselectedItemColor: Colors.black54,
  selectedItemColor: primaryColor,
);

var outlineInput = OutlineInputBorder(
  borderRadius: defaultBorderRadius,
  borderSide: const BorderSide(color: Colors.transparent),
);

var inputDecoration = InputDecorationTheme(
  contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
  filled: true,
  fillColor: primarySwatch.shade100,
  border: outlineInput,
  focusedBorder: outlineInput,
  enabledBorder: outlineInput,
);

ThemeData lightTheme(BuildContext context) {
  return ThemeData.light().copyWith(
    useMaterial3: true,
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
    scaffoldBackgroundColor: backgroundColor,
    textTheme: GoogleFonts.comfortaaTextTheme(),
    elevatedButtonTheme: elevateButton,
    outlinedButtonTheme: outlineButton,
    bottomNavigationBarTheme: bottomNavigationStyle,
    inputDecorationTheme: inputDecoration,
  );
}
