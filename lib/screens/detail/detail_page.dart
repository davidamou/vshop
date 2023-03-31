import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/screens/detail/components/detail_size.dart';
import 'package:vshop/utils/widget_function/function.dart';
import 'package:vshop/screens/detail/components/detail_bottom_bar.dart';
import 'package:vshop/screens/detail/components/detail_image.dart';
import '../../constants/text_style.dart';
import '../../models/product.dart';
import '../login/login_modal.dart';
import 'components/color_indicator.dart';

class DetailPage extends StatefulWidget {
  final Product product;

  const DetailPage({Key? key, required this.product}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var _size = 0;
  int _colorIndex = 0;
  int _imageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail product'),
        leading: back(context),
        actions: [
          IconButton(
            onPressed: addToCart,
            icon: const Icon(Iconsax.heart),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            AspectRatio(
              aspectRatio: 1,
              child: DetailImage(
                images: product.images!,
                colorIndex: _colorIndex,
                onImageChanged: (int index) {
                  setState(() => _imageIndex = index);
                },
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              '${product.name}',
              style: titleMedium(context, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12.0),
            Row(
              children: [
                const Icon(
                  Iconsax.star1,
                  color: Colors.orange,
                  size: 16,
                ),
                Text(
                  " 4.8",
                  style: titleSmall(context, fontWeight: FontWeight.bold),
                ),
                Text(
                  "(3335)   *   212 reviwes",
                  style: bodySmall(context),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Text(
              '${product.description}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: bodyMedium(context),
            ),
            const SizedBox(height: 16.0),
            ColorIndicator(
              currentIndex: _colorIndex,
              onTap: (index) => setState(() => _colorIndex = index),
              colors: getColors(),
            ),
            const SizedBox(height: 16.0),
            DetailSize(
              onSizeChanged: (size) => setState(() => _size = size),
              size: product.size!,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
      bottomNavigationBar: DetailBottomBar(
        imageUrl: product.images![_colorIndex]['imagesUrl'][_imageIndex],
        size: product.size![_size],
        price: product.price!,
        promo: product.promo!,
      ),
    );
  }

  List<Color> getColors() {
    return widget.product.images!
        .map((image) => Color(int.parse("0xff${image['color']}")))
        .toList();
  }

  void addToCart() {
    if (FirebaseAuth.instance.currentUser != null) {
      //
    } else {
      showLoginModal(context);
    }
  }
}
