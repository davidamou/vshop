import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/text_style.dart';
import 'package:vshop/screens/home/home_page.dart';

AppBar homeAppBar(BuildContext context) => AppBar(
      title: const Text('VShop'),
      automaticallyImplyLeading: false,
      titleTextStyle: titleLarge(
        context,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: false,
      actions: [
        IconButton(
          onPressed: () => context.push('/cart'),
          icon: const Icon(Iconsax.shopping_cart),
        ),
        IconButton(
          onPressed: () {
            HomePage.homeScaffoldKey.currentState!.openEndDrawer();
          },
          icon: const Icon(Iconsax.setting),
        ),
      ],
    );
