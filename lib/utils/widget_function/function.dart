import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

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
