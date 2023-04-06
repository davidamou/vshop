import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vshop/utils/router/router.dart';
import 'package:vshop/utils/themes/dark_theme.dart';
import 'package:vshop/utils/themes/light_theme.dart';
import 'package:vshop/utils/widget_function/function.dart';

import 'firebase_options.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.light);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    restoreThemeMode();

    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeMode,
      builder: (context, themeModeValue, child) {
        return MaterialApp.router(
          title: 'VShop',
          theme: lightTheme(context),
          darkTheme: darkTheme(context),
          themeMode: themeModeValue,
          routerConfig: router,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
