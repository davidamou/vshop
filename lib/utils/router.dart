import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/models/product.dart';
import 'package:vshop/pages/detail_page.dart';
import 'package:vshop/pages/home_page.dart';
import 'package:vshop/pages/navigation_page.dart';
import 'package:vshop/pages/search_page.dart';
import 'package:vshop/pages/start_page.dart';

import '../pages/shopping_page.dart';

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
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/detail',
      builder: (context, state) => DetailPage(product: state.extra as Product),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/shopping',
      builder: (context, state) => const ShoppingPage(),
    ),
    ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => NavigationPage(child: child),
      routes: [
        GoRoute(
          path: '/home',
          builder: (context, state) => const HomePage(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchPage(),
        )
      ],
    ),
  ],
);
