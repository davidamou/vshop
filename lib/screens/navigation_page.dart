import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

class NavigationPage extends StatelessWidget {
  final Widget child;
  static ValueNotifier<int> indexNotifyValue = ValueNotifier(0);

  const NavigationPage({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexNotifyValue,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          onTap: (index) {
            indexNotifyValue.value = index;
            if (index == 0) context.go('/home');
            if (index == 1) context.go('/search');
            if (index == 2) context.push('/shopping');
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Iconsax.home),
              label: 'Accueill',
              activeIcon: Icon(Iconsax.home_15),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.search_normal_1),
              label: 'Rechercher',
              activeIcon: Icon(Iconsax.search_normal_15),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.shopping_bag),
              label: 'Panier',
              activeIcon: Icon(Iconsax.shopping_bag5),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Favoris',
              activeIcon: Icon(Iconsax.heart5),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.user),
              label: 'Utilisateur',
              activeIcon: Icon(Iconsax.user),
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
