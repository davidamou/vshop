import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/models/product.dart';
import 'package:vshop/router/shell_router.dart';
import 'package:vshop/screens/detail/detail_page.dart';
import 'package:vshop/screens/loading/start_page.dart';
import '../screens/cart/shopping_page.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/',
  routes: [
    shellRouter,
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
  ],
);
