import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';

import 'login/login_modal.dart';

class NavigationPage extends StatelessWidget {
  final Widget child;
  static ValueNotifier<int> indexNotifyValue = ValueNotifier(0);
  NavigationPage({Key? key, required this.child}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: indexNotifyValue,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          onTap: (index) {
            if (index == 0) {
              context.go('/home');
              indexNotifyValue.value = index;
            }
            if (index == 1) {
              indexNotifyValue.value = index;
              context.go('/search');
            }
            if (index == 2) {
              context.go('/shopping');
            }
            if (index == 3) {
              if (user != null) {
                context.go('/favorite');
                indexNotifyValue.value = index;
              } else {
                showLoginModal(context);
              }
            }
            if (index == 4) {
              context.go('/profile');
            }
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
              icon: Icon(Iconsax.notification),
              label: 'Panier',
              activeIcon: Icon(Iconsax.notification),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.heart),
              label: 'Favoris',
              activeIcon: Icon(Iconsax.heart5),
            ),
            BottomNavigationBarItem(
              icon: Icon(Iconsax.profile_circle),
              label: 'Utilisateur',
              activeIcon: Icon(Iconsax.profile_circle5),
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    );
  }
}
