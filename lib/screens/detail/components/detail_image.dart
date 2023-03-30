import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../../../constants/function.dart';

class DetailImage extends StatelessWidget {
  final List images;
  final int colorIndex;
  final int? currentIndex;
  final Function(int index) onImageChanged;

  const DetailImage(
      {Key? key,
      this.currentIndex = 0,
      required this.images,
      required this.colorIndex,
      required this.onImageChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        initialPage: currentIndex!,
        onPageChanged: (index, reason) => onImageChanged(index),
        viewportFraction: 0.7,
        aspectRatio: 0.1,
        enlargeCenterPage: true,
      ),
      items: (images[colorIndex]['imagesUrl'] as List)
          .map(
            (imageUrl) => Container(
              clipBehavior: Clip.antiAlias,
              width: getScreenSize(context).width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
