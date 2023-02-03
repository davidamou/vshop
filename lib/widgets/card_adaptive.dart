import 'package:flutter/material.dart';
import 'package:vshop/constants/style.dart';
import 'package:vshop/widgets/cache_network_image_adaptive.dart';

import '../models/product.dart';

class CardAdaptive extends StatefulWidget {
  final Product product;

  const CardAdaptive({Key? key, required this.product}) : super(key: key);

  @override
  State<CardAdaptive> createState() => _CardAdaptiveState();
}

class _CardAdaptiveState extends State<CardAdaptive> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: defaultBorderRadius,
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 1,
            child: CacheNetworkImageAdaptive(
              imageUrl: '${widget.product.images?.first['imageUrl']}',
            ),
          ),
          const SizedBox(height: 12),
          Text('${widget.product.name}'),
          const SizedBox(height: 8),
          Text('\$ ${widget.product.price}'),
        ],
      ),
    );
  }
}
