import 'package:flutter/material.dart';

const primaryColor = Color(0XFF1E1E1E);
const primaryColorDark = Color(0xffffd791);
const backgroundColor = Colors.white;

MaterialColor primarySwatch = MaterialColor(
  primaryColor.value,
  {
    50: primaryColor.withOpacity(.05),
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
MaterialColor primarySwatchDark = MaterialColor(
  primaryColorDark.value,
  {
    50: primaryColor.withOpacity(.05),
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
