import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../login/login_modal.dart';

class NavigationPage extends StatelessWidget {
  final Widget child;
  static ValueNotifier<int> navCureentIndexValue = ValueNotifier(0);
  NavigationPage({Key? key, required this.child}) : super(key: key);

  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: navCureentIndexValue,
        builder: (context, value, child) => BottomNavigationBar(
          currentIndex: value,
          onTap: (index) {
            navCureentIndexValue.value = index;
            switch (index) {
              case 0:
                context.go('/home');
                break;
              case 1:
                context.go('/search');
                break;
              case 2:
                context.go('/notification');
                break;
              case 3:
                if (user != null) {
                  context.go('/favorite');
                } else {
                  showLoginModal(context);
                }
                break;
              case 4:
                context.go('/profile');
                break;
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
              activeIcon: Icon(Iconsax.notification_1),
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
