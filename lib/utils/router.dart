import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/screens/home_page.dart';
import 'package:vshop/screens/navigation_page.dart';
import 'package:vshop/screens/start_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const StartPage(),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => NavigationPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        )
      ],
    ),
  ],
);
