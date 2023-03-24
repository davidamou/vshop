import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/screens/detail/components/color_indicator.dart';
import 'package:vshop/screens/detail/components/image_indicator.dart';
import '../../../constants/function.dart';

class DetailAppBar extends StatefulWidget {
  final List images;
  const DetailAppBar({super.key, required this.images});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  int _imageIndex = 0;
  int _colorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: back(context),
      actions: [
        IconButton(
          onPressed: () => context.push('/shopping'),
          icon: const Icon(Iconsax.shopping_bag),
        ),
        IconButton(
          onPressed: _addToFavorite,
          icon: const Icon(Iconsax.heart),
        ),
      ],
      expandedHeight: getScreenSize(context).height / 1.2,
      flexibleSpace: Stack(
        children: [
          SizedBox(
            width: getScreenSize(context).width,
            child: CarouselSlider(
              items: _getListImage(),
              options: CarouselOptions(
                initialPage: _imageIndex,
                onPageChanged: (index, reason) {
                  setState(() => _imageIndex = index);
                },
                viewportFraction: 1,
                aspectRatio: 0.1,
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: ColorIndicator(
              currentIndex: _colorIndex,
              onTap: (index) => setState(() => _colorIndex = index),
              colors: getColors(),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: ImageIndicator(
              currentIndex: _imageIndex,
              imageNumber: _getListImage().length,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _getListImage() {
    return (widget.images[_colorIndex]['imagesUrl'] as List)
        .map(
          (imageUrl) => SizedBox(
            width: getScreenSize(context).width,
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        )
        .toList();
  }

  List<Color> getColors() {
    return widget.images
        .map((image) => Color(int.parse("0xff${image['color']}")))
        .toList();
  }

  _addToFavorite() {}
}
