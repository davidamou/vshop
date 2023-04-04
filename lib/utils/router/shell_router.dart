import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vshop/utils/router/router.dart';
import '../../screens/favorite/favorite_page.dart';
import '../../screens/home/home_page.dart';
import '../../screens/navigation/navigation_page.dart';
import '../../screens/notification/notification_page.dart';
import '../../screens/profile/profile_page.dart';
import '../../screens/search/search_page.dart';

final shellRouter = ShellRoute(
  navigatorKey: shellNavigatorKey,
  pageBuilder: (context, state, child) => pageBuilder(
    context,
    state,
    NavigationPage(child: child),
  ),
  routes: [
    GoRoute(
      path: '/home',
       pageBuilder: (context, state) =>
          pageBuilder(context, state, const HomePage()),
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) =>
          pageBuilder(context, state, const SearchPage()),
    ),
    GoRoute(
      path: '/favorite',
      pageBuilder: (context, state) =>
          pageBuilder(context, state, const FavoritePage()),
    ),
    GoRoute(
      path: '/profile',
      pageBuilder: (context, state) =>
          pageBuilder(context, state, const ProfilePage()),
    ),
    GoRoute(
      path: '/notification',
      pageBuilder: (context, state) =>
          pageBuilder(context, state, const NotificationPage()),
    ),
  ],
);

pageBuilder(context, state, Widget page) {
  return CustomTransitionPage(
    child: page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}
