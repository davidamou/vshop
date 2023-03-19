import 'package:go_router/go_router.dart';
import 'package:vshop/router/router.dart';
import '../screens/favorite_page.dart';
import '../screens/home/home_page.dart';
import '../screens/navigation_page.dart';
import '../screens/profile/profile_page.dart';
import '../screens/search_page.dart';

final shellRouter = ShellRoute(
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
);