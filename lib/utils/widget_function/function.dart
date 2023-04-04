import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../main.dart';

Widget back(BuildContext context) {
  return IconButton(
    onPressed: () => context.pop(),
    icon: const Icon(Iconsax.arrow_left_2),
  );
}

Size getScreenSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

Color getPrimaryColor(BuildContext context) {
  return Theme.of(context).colorScheme.primary;
}

Color getBackgroundColor(BuildContext context) {
  return Theme.of(context).colorScheme.background;
}

Color getTextColor(BuildContext context) {
  return Theme.of(context).colorScheme.onBackground;
}

Future<void> changeThemeMode(BuildContext context) async {
  if (Theme.of(context).brightness == Brightness.light) {
    themeMode.value = ThemeMode.dark;
  } else {
    themeMode.value = ThemeMode.light;
  }

  var pref = await SharedPreferences.getInstance();
  pref.setString('themeMode', themeMode.value.name);
}

void restoreThemeMode() {
  var pref = SharedPreferences.getInstance();
  pref.then((value) {
    if (value.getString('themeMode') == 'dark') {
      themeMode.value = ThemeMode.dark;
    } else {
      themeMode.value = ThemeMode.light;
    }
  });
}
