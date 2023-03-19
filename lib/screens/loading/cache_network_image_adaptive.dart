import 'dart:math' as math;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:vshop/constants/style.dart';

class CacheNetworkImageAdaptive extends StatelessWidget {
  final String imageUrl;

  const CacheNetworkImageAdaptive({Key? key, required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      placeholder: (context, url) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            color: Color(math.Random().nextInt(Colors.blue.value)).withOpacity(0.5),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: defaultBorderRadius,
            color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
          ),
          child: const Center(child: Icon(Iconsax.image)),
        );
      },
    );
  }
}
