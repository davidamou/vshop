import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vshop/screens/login/login_modal.dart';

import '../../../constants/text_style.dart';

class DetailBottomBar extends StatelessWidget {
  final double price;
  final double promo;
  final String size;
  final String imageUrl;

  const DetailBottomBar(
      {Key? key,
      required this.price,
      required this.promo,
      required this.size,
      required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Theme.of(context).colorScheme.background,
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                const Text("\$"),
                Text(
                  "${(price * promo) / 100}",
                  style: titleLarge(context, fontWeight: FontWeight.bold),
                ),
                const Text("  \$"),
                Text(
                  "$price",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () => _addToCart(context),
              child: const Text('Add to cart'),
            ),
          )
        ],
      ),
    );
  }

  void _addToCart(BuildContext context) {
    if (FirebaseAuth.instance.currentUser != null) {
      //
    } else {
      showLoginModal(context);
    }
  }
}
