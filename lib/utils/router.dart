import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/models/product.dart';
import 'package:vshop/screens/detail_page.dart';
import 'package:vshop/screens/favorite_page.dart';
import 'package:vshop/screens/home_page.dart';
import 'package:vshop/screens/navigation_page.dart';
import 'package:vshop/screens/profile_page.dart';
import 'package:vshop/screens/search_page.dart';
import 'package:vshop/screens/start_page.dart';

import '../screens/shopping_page.dart';

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
        ),
        GoRoute(
          path: '/favorite',
          builder: (context, state) => const FavoritePage(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfilePage(),
        )
      ],
    ),
  ],
);
