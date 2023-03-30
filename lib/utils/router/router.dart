import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/models/product.dart';
import 'package:vshop/screens/detail/detail_page.dart';
import 'package:vshop/screens/login/start_page.dart';
import 'package:vshop/screens/login/verify_password.dart';
import 'package:vshop/utils/router/shell_router.dart';
import '../../screens/cart/shopping_page.dart';
import '../../screens/login/register_form.dart';

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
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/register',
      builder: (context, state) => const RegisterForm(),
    ),
    GoRoute(
      parentNavigatorKey: rootNavigatorKey,
      path: '/verify-password',
      builder: (context, state) => const VerifyPassword(),
    ),
  ],
);
