import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';

import '../models/post.dart';
import 'cache_network_image_adaptive.dart';

class PostView extends StatelessWidget {
  final Post post;

  const PostView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        );
    return AspectRatio(
      aspectRatio: 2.4,
      child: Stack(
        children: [
          CacheNetworkImageAdaptive(imageUrl: post.imageUrl),
          Positioned(
            top: 32,
            left: 16,
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('New collection', style: textStyle),
                const SizedBox(height: 16),
                InkWell(
                  borderRadius: defaultBorderRadius,
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.background,
                      borderRadius: defaultBorderRadius,
                    ),
                    child: Text(
                      'Shop Now',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
