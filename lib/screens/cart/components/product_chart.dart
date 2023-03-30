import 'package:flutter/material.dart';
import 'package:vshop/widgets/cache_network_image_adaptive.dart';

import '../../../constants/style.dart';

class ProductChart extends StatefulWidget {
  late int quantity;
  final String productId;
  final String imageUrl;
  final String productName;
  final String size;
  final double price;

  ProductChart(
      {super.key,
      required this.quantity,
      required this.productId,
      required this.imageUrl,
      required this.productName,
      required this.size,
      required this.price});

  @override
  State<ProductChart> createState() => _ProductChartState();
}

class _ProductChartState extends State<ProductChart> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: CacheNetworkImageAdaptive(
                imageUrl: widget.imageUrl,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  overflow: TextOverflow.ellipsis,
                  widget.productName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                const Text('Size: 36  *  Color: Brown'),
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Text(
                      '\$',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    Text(
                      '${widget.quantity * widget.price}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 20.0),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 2.0),
            decoration: BoxDecoration(
              borderRadius: defaultBorderRadius,
              border: Border.all(
                width: 0.5,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                quantityButton(
                  icon: const Text('-'),
                  onTap: () {
                    setState(() {
                      if (widget.quantity > 1) widget.quantity -= 1;
                    });
                  },
                ),
                const SizedBox(width: 4.0),
                Text('${widget.quantity}'),
                const SizedBox(width: 4.0),
                quantityButton(
                  icon: const Text('+'),
                  onTap: () => setState(() {
                    if (widget.quantity < 25) widget.quantity += 1;
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  quantityButton({required Widget icon, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: defaultBorderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: icon,
      ),
    );
  }
}
