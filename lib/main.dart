import 'package:flutter/material.dart';
import 'package:vshop/utils/router.dart';
import 'package:vshop/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'VShop',
      routerConfig: router,
      theme: theme(context),
    );
  }
}

